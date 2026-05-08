# Windrose

## Steam Description

> Windrose is a survival adventure set in an alternative Age of Piracy. It features the classic “build, craft, survive” formula along with intense combat and engaging exploration on land and sea.
>
> Progress through vast procedurally generated biomes filled with hidden mysteries, hand-crafted dungeons and quests. Gather your crew and captain your ship through brutal naval combat with boarding actions and seamless transitions between ship and shore.
>
> Defeat challenging bosses on your swashbuckling adventure driven by real-world characters and supernatural forces alike.

Game App ID: `3041230`
Server App ID: `4129620`

## Configuration

Read this [official guide](https://playwindrose.com/dedicated-server-guide/) on how to configure the server.
Some important info:

- Configuration is stored in `ServerDescription.json` (server name, invite code, password, max players) and per-world `WorldDescription.json` files (world name, difficulty preset, custom parameters).
- World saves are located at: `R5\Saved\SaveProfiles\Default\RocksDB\{GameVersion}\Worlds\` (a copy is also kept under `RocksDB_v2_Backups/`)
- Up to **4 players** is recommended for stable performance.

## Server Ports

Use either the invite code system (in which case you don't need to directly make an allocation) or DirectIP options on server setup (make sure to match the port with your designated allocation).
