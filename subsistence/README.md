# Subsistence

[Subsistence](https://store.steampowered.com/app/418030/Subsistence/) is an open-world, sandbox, first-person, solo or co-op survival game. Build a base, hunt for food, defend against AI hunters, and compete or cooperate with other players.

The dedicated server (Steam app `1362640`) is Windows-only (UDK.exe / Unreal Engine 3), so this egg installs the Windows depot through SteamCMD and runs it under Wine + Xvfb using the Pelican Wine yolk (`ghcr.io/pelican-eggs/yolks:wine_latest`).

Official server setup guide: https://steamcommunity.com/sharedfiles/filedetails/?id=2201638184

### Configuration files

| File | Purpose | Path |
|------|---------|------|
| UDKDedServerSettings.ini | Server settings (name, difficulty, PvP rules, base decay, mods, etc.) | `UDKGame/Config/UDKDedServerSettings.ini` |

## Server Ports

| Name  | Default |
|-------|---------|
| Game  | 7777    |
| Query | 27015   |

Allocate the game port and the query port (so the server appears in the in-game list).
