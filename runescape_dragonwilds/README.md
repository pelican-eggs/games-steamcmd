# RuneScape: Dragonwilds

### Authors / Contributors

<!-- prettier-ignore-start -->
<!-- markdownlint-disable -->
<table>
    <tr>
        <td align="center">
            <a href="https://github.com/redthirten">
                <img src="https://avatars.githubusercontent.com/u/4533989" width="50px;" alt=""/><br /><sub><b>Red-Thirten</b></sub>
            </a>
            <br />
            <a href="https://github.com/pelican-eggs/games-steamcmd/commits?author=redthirten" title="Codes">💻</a>
            <a href="https://github.com/pelican-eggs/games-steamcmd/commits?author=redthirten" title="Maintains">🔨</a>
        </td>
        <td align="center">
            <a href="https://github.com/NeilHanlon">
                <img src="https://avatars.githubusercontent.com/u/680198" width="50px;" alt=""/><br /><sub><b>NeilHanlon</b></sub>
            </a>
            <br />
            <a href="https://github.com/pelican-eggs/games-steamcmd/commits?author=NeilHanlon" title="Codes">💻</a>
            <a href="https://github.com/pelican-eggs/games-steamcmd/commits?author=NeilHanlon" title="Contributor">💡</a>
        </td>
    </tr>
</table>
<!-- markdownlint-enable -->
<!-- prettier-ignore-end -->

___

### Game Description

From the Steam [Store Page](https://store.steampowered.com/app/1374490/RuneScape_Dragonwilds/):
> On RuneScape’s forgotten continent of Ashenfall, dragons have awoken. Gather, build, skill and craft to survive in this co-operative (1-4) survival crafting game. Only by mastering survival and uncovering ancient secrets can they hope to slay the Dragon Queen—alone or with allies.

___

### Installation/System Requirements

|  | Bare Minimum | Recommended |
|---------|---------|---------|
| Processor | 64-bit processor | --- |
| RAM | 3072 MiB (2 GiB + 1 GiB/player) | 8192 MiB (2 GiB + 1 GiB/player x 6 players) |
| Storage | 6144 MiB | 8192 MiB |
| Host OS | Most stable 64-bit Linux OS branches should work. | Using the latest kernel version for your installed OS can prevent some edge-case installation/boot issues. |
| Game Ownership | Not required | --- |

> [!WARNING]
> If you wish to have the server accessible via LAN, you may need to configure a NAT reflection in your router. This is because the server only relays its public IP to Epic Online Services (EOS), and the client will only connect to the IP given by EOS. This may be fixed client-side in the near future.

___

### Server Ports

| Port | Default | Protocol | Required |
|---------|---------|---------|---------|
| **Primary** | 7777 | UDP | **Yes** |

___

### World Management

Please see the [official documentation](https://dragonwilds.runescape.com/news/how-to-dedicated-servers#:~:text=join%20and%20enjoy!-,WORLD%20MANAGEMENT,-When%20a%20Dedicated) for instructions on:

1. Moving a world to the dedicated server
2. Creating a new world with custom settings
    - eg. PVP, Creative, etc...

___

### Joining the Server

1. Take note of your World name. This will either be your Default World Name (under the Startup tab), or the name of the World you uploaded.
2. In game, go to the Public tab of the Worlds screen.
3. In the search bar, enter your **exact** World name, **case sensitive**.
4. Press Enter, and your server should appear for joining.

___

### Console Commands

There are no console commands known at this time.

___

### Sample Ignore File for Backups

World saves are the only data critical to a full restore — game binaries are re-downloaded by Steam and the config file is repopulated by the panel on next startup. `PersistentDownloadDir/` and `SpudCache/` are excluded as they are large and fully regenerated.

```gitignore
# Ignore all game files
*
# Keep save data
!RSDragonwilds/
!RSDragonwilds/Saved/
!RSDragonwilds/Saved/SaveGames/
!RSDragonwilds/Saved/Config/
!RSDragonwilds/Saved/Logs/
# Exclude large/unnecessary Saved subdirectories
RSDragonwilds/Saved/PersistentDownloadDir/
RSDragonwilds/Saved/SpudCache/
```