# Subsistence

Subsistence is an open-world sandbox survival game centered around base building, hunting, farming, and defending against AI hunters and other players. Steam app 1362640.

The dedicated server is Windows-only (UDK.exe / Unreal Engine 3), so this egg installs the Windows depot through SteamCMD and runs it under Wine + Xvfb using the Pelican Wine yolk.

Official server documentation: https://steamcommunity.com/sharedfiles/filedetails/?id=2201638184

### Configuration files

|   File    |  Purpose  |   Path  |
|-----------|-----------|---------|
| UDKDedServerSettings.ini | Server name, difficulty, PvP rules, base decay, mods | `UDKGame/Config/UDKDedServerSettings.ini` |

## Server Ports

| Name  | Default | Protocol |
|-------|---------|----------|
| Game  | 7777    | UDP/TCP  |
| Peer  | 7778    | UDP/TCP  |
| Query | 27015   | UDP      |

Allocate the game port, the query port so the server appears in the in-game list, and game port + 1 (7778) for UE3 peer traffic.
