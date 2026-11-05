# Alchemy Factory

Alchemy Factory is a factory-building game with alchemy and online co-op. This egg runs the experimental Windows dedicated server through Proton.

[Steam](https://store.steampowered.com/app/3669570/)

[Dedicated server guide](https://steamcommunity.com/sharedfiles/filedetails/?id=3797831446)

### Configuration files

| File | Purpose | Path |
|------|---------|------|
| ServerConfig.ini | Server settings | `ServerConfig.ini` |
| Save games | World saves | `AlchemyFactory/Saved/SaveGames/` |
| AlchemyFactory.log | Server log | `AlchemyFactory/Saved/Logs/AlchemyFactory.log` |

Settings exposed in the panel are applied before each start. Other settings can be changed in `ServerConfig.ini` while the server is stopped.

### Server Ports

| Port | Default | Protocol |
|------|---------|----------|
| Game | 9877 | UDP |
| Query | 9878 | UDP |

**Steam relay:** Choose a primary game allocation between `1024` and `32767`. Higher ports fail to accept relay connections.

Steam relay is enabled by default; connect using the join code in the console. For direct-IP connections, disable **Steam relay** and use the node's address and game port. Internet direct-IP connections require port forwarding.

Public listing is disabled by default and can be enabled independently of Steam relay.
