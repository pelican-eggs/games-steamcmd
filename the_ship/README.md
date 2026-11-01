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

## Notes

- **Runs the Windows server under Wine.** The Ship's native Linux dedicated server is broken
  on modern systems: it crashes during map load:
  - `The futex facility returned an unexpected error code` abort on glibc >= 2.34)
  - or some unexplained memory corruption if ran with a lower glibc version
- You cannot issue commands via the console due to the server being wrapped under Wine, but you can still view logs.
- A Steam account that owns the game is required to download the server.

### Variables

| Variable        | Description                                                        |
|-----------------|--------------------------------------------------------------------|
| `STEAM_USER`    | Steam account that owns The Ship (anonymous is refused).           |
| `STEAM_PASS`    | Password for that account.                                         |
| `STEAM_AUTH`    | Steam Guard code, if one is somehow required. Normally left blank. |
| `SRCDS_MAP`     | Default map, e.g. `batavier`, `atalanta`, `huronian`.              |
| `MAX_PLAYERS`   | Maximum player slots (1-32).                                       |
| `AUTO_UPDATE`   | Update the server files on each (re)start.                         |
