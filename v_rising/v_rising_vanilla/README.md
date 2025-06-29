# V Rising

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
            <a href="https://github.com/kapatheus">
                <img src="https://avatars.githubusercontent.com/u/59861026" width="50px;" alt=""/><br /><sub><b>Kapatheus</b></sub>
            </a>
            <br />
            <a href="https://github.com/pelican-eggs/games-steamcmd/commits?author=kapatheus" title="Codes">💻</a>
            <a href="https://github.com/pelican-eggs/games-steamcmd/commits?author=kapatheus" title="Contributor">💡</a>
        </td>
    </tr>
</table>
<!-- markdownlint-enable -->
<!-- prettier-ignore-end -->

___

### Game Description

From Stunlock Studios's [Website](https://playvrising.com/):
> Awaken as a vampire. Hunt for blood in nearby settlements to regain your strength and evade the scorching sun to survive. Raise your castle and thrive in an ever-changing open world full of mystery. Gain allies online and conquer the land of the living.

___

### Egg Capabilities

- Currently runs the Windows build of the server via Wine. This egg will be updated once a proper, native Linux server binary is released.
- Configurable to automatically check for server updates on start via SteamCMD. Forcing validation is also configurable.
- All [formally recognized](https://github.com/StunlockStudios/vrising-dedicated-server-instructions/blob/master/1.0.x/INSTRUCTIONS.md#server-host-settings) `ServerHostSettings.json` settings can be automatically configured via Startup variables.
  - This includes: Server name, game settings preset, password, max players, auto save settings, and more...
  - This does not include some obscure settings (ie. Enable API, Disable Save File Compression, etc.), but these can still be modified with a custom `ServerHostSettings.json` file created in `~/save-data/Settings/`.
- RCON ready (\*requires extra port – see [Server Ports](#server-ports)). See the RCON section under [Manual Configuration Topics](#manual-configuration-topics) for more info.

___

### Server Ports

- Default server ports are listed below, but all three ports can be changed freely.
- The only *required* port is the Game port, but the Query port is needed for the server to appear in the server list (Direct connect is still possible without the Query port). There have also been reports that servers only appear in the server list if they are popular, so consider this when troubleshooting.
- Clients connect via the Game port.
- The RCON port is optional and only required if the server owner enables/uses RCON.

| Port | Default | Protocol |
|---------|---------|---------|
| **Game (Primary Port)** | 9876 | UDP |
| Query | 9877 | UDP |
| RCON | 25575 | TCP |

___

### Installation/System Requirements

|  | Bare Minimum | Recommended |
|---------|---------|---------|
| Processor | Recent x86/64 (AMD/Intel) processor. No 32 bit or ARM support. | Unsubstantiated reports say that RCON uses significantly more CPU when enabled, but I have not been able to replicate myself. |
| RAM | 3072 MiB | 4096-6144 MiB |
| Storage | 3.5 GB | 5-10 GB (or more, depending on save size or frequency) |
| Game Ownership | Not required at all. | ---- |

___

### Manual Configuration Topics

The following are various topics covering manual configuration procedures the egg does not handle automatically that may be useful to server owners:

#### Save File and Custom Settings Location

You can find the game settings and saves in the `~/save-data/` directory.

#### Server Game Settings

Standardized game settings can be applied via the "Game Settings Preset" startup parameter. If you would like a more custom array of settings to adjust, you can copy the `ServerGameSettings.json` file located in `~/VRisingServer_Data/StreamingAssets/Settings/` to `~/save-data/Settings/` and adjust as needed. Also, ensure "Game Settings Preset" is set to empty/null. A list of settings, with a description of what each setting does and the min/max values where applicable, [can be found here](https://cdn.stunlock.com/blog/2022/05/25083113/Game-Server-Settings.pdf).

#### Becoming an Administrator

To become an administrator in the game you will first need to open the `adminlist.txt` file under `~/VRisingServer_Data/StreamingAssets/Settings/` and add your [steamID64](https://steamid.io/) (one steamID64 per line). This can be done without restarting your server. To become an administrator in the game you need to enable the console in the options menu, open it with `` ` `` and authenticate using the `adminauth` console command. Once an administrator you can use a number of administrative commands like `banuser`, `bancharacter`, `banned`, `unban` and `kick`.

If you ban users through the in-game console the server will automatically modify the `banlist.txt` file, but you can also modify this manually (one steamID64 per line).

#### Transfer Local/Client Save to the Server

[Follow these instructions by the developer very carefully](https://github.com/StunlockStudios/vrising-dedicated-server-instructions/blob/master/1.0.x/INSTRUCTIONS.md#transfer-localclient-save-to-a-dedicated-server). Note: The `-saveName <name>` command line parameter and `GameSettingsPreset` setting are handled automatically by the Egg's "Save Name" and "Game Settings Preset" startup parameters, respectively. Also, if a custom `ServerGameSettings.json` file exists for any reason in the `~/save-data/Settings` directory, delete it.

#### RCON

RCON can allow general and restart announcements to be made to the server remotely (functions which are not currently supported by the console command line). You can enable RCON by properly configuring the relevant variables under the Startup tab of your server. The RCON port must be allocated to the server. [Click here for list of valid commands and recommended RCON client](https://github.com/StunlockStudios/vrising-dedicated-server-instructions/blob/master/1.0.x/INSTRUCTIONS.md#rcon-1).
