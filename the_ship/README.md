# The Ship: Murder Party

## From their [Steam Store page](https://store.steampowered.com/app/2400/The_Ship_Murder_Party/)

The Ship is a multiplayer murder-mystery game built on the Source engine. Each player is given 
a Quarry to kill – and must evade their own Hunter in the process, all set on board a series 
of 1920s art deco cruise ships.

### Server Ports

The Ship requires a single game port. It can be changed to any other.

| Port | default |
|------|---------|
| Game | 27015   |

## Steam Download [SteamStore](https://store.steampowered.com/app/2400/The_Ship_Murder_Party/)

## Notes

- **Runs the Windows server under Wine.** The Ship's native Linux dedicated server is broken
  on modern systems: it crashes during map load:
  - `The futex facility returned an unexpected error code` abort on glibc >= 2.34)
  - or some unexplained memory corruption if ran with a lower glibc version
- Console is driven over RCON. The server is started with  `+log on +logaddress_add 127.0.0.1:27500`, 
  which makes Source forward every log event over UDP the instant it happens. A tiny listener 
  (`udplog.py`, written by the install script) prints those events to the panel console, 
  so logs appear live. The startup command then attaches a persistent RCON terminal.
- A licensed Steam account is required.

### Variables

| Variable        | Description                                                        |
|-----------------|--------------------------------------------------------------------|
| `STEAM_USER`    | Steam account that owns The Ship (anonymous is refused).           |
| `STEAM_PASS`    | Password for that account.                                         |
| `STEAM_AUTH`    | Steam Guard code, if one is somehow required. Normally left blank. |
| `RCON_PASSWORD` | Password for the panel console (RCON). Set this to something secret. |
| `SRCDS_MAP`     | Default map, e.g. `batavier`, `atalanta`, `huronian`.              |
| `MAX_PLAYERS`   | Maximum player slots (1-32).                                       |
| `AUTO_UPDATE`   | Update the server files on each (re)start.                         |
