# HumanitZ


## [Documentation](https://store.steampowered.com/app/2728330/HZ_SERVER)


HumanitZ is a co-op, isometric, open world survival game in a world ended by the zombie outbreak. As one of the few human survivors, try to last as long as “humanly” possible. The past can’t be changed, but you can make a difference today for the future of humanity. 

## Install notes

The current version of the server software is slightly buggy. The only official documentation is the [Private Server Hosting Setup](https://humanitz.wiki.gg/wiki/Private_Server_Hosting_Setup) guide on the official HumanitZ wiki.

They include a `README.txt` file with the server software, that includes a description of most of the variables, but not more than that. This is only obtainable via the SteamCMD tool.

## Installation/System Requirements

Requires a 64-bit processor and operating system

## Server Ports

Ports required to run the server in a table format.

| Port         | default |
|--------------|---------|
| Game  Port   | 7777    |
| Query Port   | 27015   |

### Notes

7777 is the default port, but any port can be used.

## Egg notes for panel admins

This egg exposes only a **curated core** of `GameServerSettings.ini` as panel variables: server identity, access, RCON, and the Steam install/update controls. The full config still ships: the game depot includes `REF_GameServerSettings.ini` (the upstream reference with every setting at its default), and Wings' `ini` parser overwrites only the declared keys on each boot while preserving everything else.

**Editing advanced settings:** open the server → **Files** → edit `HumanitZServer/GameServerSettings.ini` and restart. Undeclared keys persist across restarts and reinstalls.

### Keeping configs current across game updates

The installer fetches the repository-maintained `ini-merge.sh` helper, which runs on every boot (and on install/reinstall). It adds only keys that exist in `REF_GameServerSettings.ini` but are missing from your live config, using the reference default. Existing keys, including your edits and custom keys, are never touched. So new settings from a SteamCMD update appear automatically at their upstream default, ready to tweak, and nothing you changed is lost.

**Upgrading an existing server to this egg:** import/update the egg in the panel, then **reinstall the server once** so the helper script is written and the new startup command takes effect. A reinstall re-runs SteamCMD over the existing files and normally leaves your `GameServerSettings.ini` and saves intact, but **back up your world/save files first** as a precaution. Fresh installs need no extra steps.
