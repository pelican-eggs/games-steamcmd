#!/usr/bin/env bash
# ini-merge.sh - additively merge missing keys from a reference INI into a live INI.
#
# Usage: ini-merge.sh <reference.ini> <live.ini>
#
# Behaviour:
#   - Adds ONLY keys that exist in <reference.ini> but are absent from <live.ini>.
#   - Never edits, reorders, or deletes keys already present in <live.ini>
#     (user edits are always preserved).
#   - New keys are appended to the end of their matching section, using the
#     reference file's default value. Sections absent from the live file are
#     appended whole.
#   - Idempotent: a second run with no upstream changes is a no-op.
#   - Non-fatal by design: any problem is logged and the script exits 0 so it
#     can never block server boot. The live file is only replaced via an atomic
#     rename, and only after a one-shot backup (<live>.bak).
set -u

REF="${1:-}"
LIVE="${2:-}"

log() { printf '[ini-merge] %s\n' "$*"; }

[ -n "$REF" ] && [ -n "$LIVE" ] || { log "usage: ini-merge.sh <reference.ini> <live.ini>; skipping"; exit 0; }
command -v awk >/dev/null 2>&1 || { log "awk not found; skipping merge"; exit 0; }
[ -f "$REF" ]  || { log "reference '$REF' not found; nothing to merge"; exit 0; }

# No live config yet: seed it wholesale from the reference and stop.
if [ ! -f "$LIVE" ]; then
    if cp -- "$REF" "$LIVE"; then log "seeded '$LIVE' from reference"; else log "seed of '$LIVE' failed"; fi
    exit 0
fi

TMP="$(mktemp "${LIVE}.merge.XXXXXX" 2>/dev/null)" || { log "mktemp failed; skipping merge"; exit 0; }

awk -v ref="$REF" '
    function trim(s){ sub(/^[ \t\r]+/,"",s); sub(/[ \t\r]+$/,"",s); return s }
    function isheader(t){ return (t ~ /^\[.*\]$/) }
    function secname(t){ sub(/^\[[ \t]*/,"",t); sub(/[ \t]*\][ \t]*$/,"",t); return t }
    function flush(s,   c,a,i){
        if (s in flushed) return
        flushed[s]=1
        if (!(s in missList)) return
        c=split(missList[s],a,SUBSEP)
        for (i=1;i<=c;i++) print a[i]
    }
    function flushblanks(   i){
        for (i=1;i<=nb;i++) print blanks[i]
        nb=0
    }
    BEGIN{
        cur=""
        while ((getline line < ref) > 0){
            t=trim(line)
            if (t=="" || t ~ /^[;#]/) continue
            if (isheader(t)){ cur=secname(t); refsec[cur]=1; continue }
            p=index(t,"=")
            if (p==0) continue
            k=trim(substr(t,1,p-1))
            if (k=="") continue
            refKeyLine[cur SUBSEP k]=t
            if ((cur SUBSEP k) in refSeen) continue
            refSeen[cur SUBSEP k]=1
            refKeys[cur]=refKeys[cur] (refKeys[cur]==""?"":SUBSEP) k
        }
        close(ref)
    }
    { lines[++nl]=$0 }
    END{
        # Pass A: record keys already present in the live file, per section.
        cur=""
        for (i=1;i<=nl;i++){
            t=trim(lines[i])
            if (isheader(t)){ cur=secname(t); livesec[cur]=1 }
            else if (t!="" && t !~ /^[;#]/){
                p=index(t,"=")
                if (p>0){ k=trim(substr(t,1,p-1)); if (k!="") have[cur SUBSEP k]=1 }
            }
        }
        # Compute missing keys per section, preserving reference order.
        for (s in refKeys){
            c=split(refKeys[s],a,SUBSEP)
            for (i=1;i<=c;i++){
                k=a[i]
                if (!((s SUBSEP k) in have)){
                    missList[s]=missList[s] (missList[s]==""?"":SUBSEP) refKeyLine[s SUBSEP k]
                    missSec[s]=1
                }
            }
        }
        # Emit live file verbatim; insert each section`s missing keys at its end.
        # Blank lines are buffered so new keys land after the last real line of a
        # section rather than after its trailing blank line.
        cur=""; nb=0
        for (i=1;i<=nl;i++){
            line=lines[i]; t=trim(line)
            if (t==""){ blanks[++nb]=line; continue }
            if (isheader(t)){
                flush(cur)
                flushblanks()
                cur=secname(t)
                print line
            } else {
                flushblanks()
                print line
            }
        }
        flush(cur)
        flushblanks()
        # Append sections that do not exist in the live file at all.
        for (s in missSec){
            if (!(s in livesec) && !(s in flushed)){
                print ""
                print "[" s "]"
                flush(s)
            }
        }
    }
' "$LIVE" > "$TMP" 2>/dev/null || { log "merge step failed; original kept"; rm -f -- "$TMP"; exit 0; }

if [ ! -s "$TMP" ]; then
    log "merge produced empty output; original kept (safety)"
    rm -f -- "$TMP"
    exit 0
fi

if cmp -s "$TMP" "$LIVE"; then
    log "no new keys to merge"
    rm -f -- "$TMP"
    exit 0
fi

cp -- "$LIVE" "${LIVE}.bak" 2>/dev/null || true
if mv -f -- "$TMP" "$LIVE"; then
    log "merged new reference keys into $(basename "$LIVE") (backup: $(basename "$LIVE").bak)"
else
    log "could not write merged file; original kept"
    rm -f -- "$TMP"
fi
exit 0
