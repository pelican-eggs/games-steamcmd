# Battlefront Eternal

[Battlefront Eternal](https://battlefronteternal.com) is a free, GPL-3.0 engine for STAR WARS Battlefront (Classic, 2004). This egg runs its headless dedicated server on Node.js 24, the same server that hosts the project's public games. Battlefront Eternal is a development preview, and new releases come out often.

Game App ID: `1058020`

## Your copy of the game

No game files come with this egg or the server. The server prepares its game data from your own copy of STAR WARS Battlefront (Classic, 2004), from Steam or GOG, and the prepared data stays on the server. Give it the game in one of two ways:

- **From Steam:** set Steam Username and Steam Password to an account that owns the game, and the installation downloads it with SteamCMD into `game/`. If Steam asks for a Steam Guard code, put a current one in Steam Guard Code and reinstall the server. SteamCMD remembers the login after that. A code from the Steam mobile app can expire before SteamCMD logs in, so with the mobile authenticator, uploading is easier. SteamCMD needs an x86_64 node.
- **Upload:** leave the Steam variables empty and upload the game's `GameData` folder, from Steam or GOG, into `game/` over SFTP, so that `game/GameData/Data/_LVL_PC` exists. Then reinstall the server. The folder is about 3 GB.

The installation prepares the game data with the release's own tools. It takes a few minutes and writes about 2.2 GB.

## Updating

Reinstall the server to update it to the newest release. A reinstall keeps `bfe-state/` and `game/`, and prepares the game data again only when the release changed its tools. Players need the same release as the server, and their app updates itself, so reinstall when a new release comes out. The install log names the version it downloaded.

## Configuration

`bfe-state/config.json` holds the server's settings. On every start the panel writes `name` from Server Name, `maxPlayers` from Max Players and `gamePort` from the primary allocation. Edit the rest in the file manager, then restart the server:

| Setting | What it does |
|---------|--------------|
| `rotation` | The playlist, played in order and then from the top. Each battle is `swbf1/MAP:SIDE:conquest`, for example `swbf1/nab2:rep:conquest`. |
| `onlineNoticeAccepted` | `true` lists the server in the in-game browser and accepts the online notice: online play processes your IP for connectivity and abuse prevention. Independent hosts and relays process connection metadata. Location sharing remains off. `false`, the default, keeps the server private, and players join it by address. |
| `relayPolicy` | `auto`, the default, lets players who can't reach the server directly come in through the project's relay. `never` suits a node with a public address, and lets the server list show players their ping. |
| `description`, `location` | Shown in the server list, up to 280 and 80 characters. |

The [server guide](https://battlefronteternal.com/servers/) lists every setting, map and side. `bfe-state/` also holds the server's identity key and its player statistics, so keep it in backups.

The console shows the server's log. The server's live administration (kicks, bans and announcements) isn't available from the panel.

## Server Ports

| Port | Default |
|------|---------|
| Game (UDP and TCP) | 18451 |

The game port carries play over UDP and the server's details over TCP, at `http://ADDRESS:PORT/info`. Any port works. Players join from the server list once the server is listed, or by address with DIRECT CONNECT. LAN discovery is off (`"discovery": false`), because a container doesn't hear the LAN's broadcasts, so players on the LAN join by address too.

## Requirements

|  | Minimum | Recommended |
|---------|---------|---------|
| CPU | 2 cores | 4 cores for a full 64-player battle |
| RAM | 2 GiB | 3 GiB |
| Storage | 10 GiB | 10 GiB |

Preparing the game data needs 1.5 GiB of memory, and the installation runs more jobs at once when the server has more. A full 64-player server needs about 2.8 GiB while Naboo: Plains loads. The storage holds the game (2.7 GiB), the prepared data (2.2 GiB), the server (0.5 GiB) and a second copy of the data while an update prepares it.

Battlefront Eternal is an independent fan project. It isn't affiliated with or endorsed by Lucasfilm, Disney, Electronic Arts, Aspyr, Valve, GOG or the developers and publishers of the original games. Star Wars, Battlefront, Steam and GOG are trademarks of their respective owners.
