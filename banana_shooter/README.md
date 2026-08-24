# Banana Shooter

## Game Description

Dave is the banana man who is keep shooting enemies and get their banana, and use some cool mechanic such as dash, double jump, grapple hook and rocket jump. If you are finding fast paced shooter game, this is what you need.

**Steam Store:** https://store.steampowered.com/app/1949740/Banana_Shooter/

## Requirements

- A Steam account that **owns Banana Shooter** is required. Anonymous login will **not** work.
- Steam Guard 2FA may need to be handled during installation.

## Ports

| Port        | Default | Protocol |
|-------------|---------|----------|
| Game        | 27017   | UDP      |
| Steam Query | 27018   | UDP      |

## Configuration

A `Config.json` file is generated on first launch inside `Servers/{ServerName}/`.

To make your server visible on the community server list, set `Login_Token` in `Config.json` with a Game Server Login Token (GSLT).

**Create a GSLT at:** https://steamcommunity.com/dev/managegameservers (use App ID `1949740`)

## Server App ID

| App              | App ID  |
|------------------|---------|
| Game             | 1949740 |
| Dedicated Server | 2406780 |
