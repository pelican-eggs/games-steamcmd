# DayZ

> [!NOTE]
> This Egg is for the standalone version of DayZ ***only***. It is not for the DayZ mod on Arma 2 or Arma 3.

___

## Authors / Contributors

<!-- prettier-ignore-start -->
<!-- markdownlint-disable -->
<table>
    <tr>
        <td align="center">
            <a href="https://github.com/lilkingjr1">
                <img src="https://avatars.githubusercontent.com/u/4533989" width="50px;" alt=""/><br /><sub><b>Red-Thirten</b></sub>
            </a>
            <br />
            <a href="https://github.com/parkervcp/eggs/commits?author=lilkingjr1" title="Codes">💻</a>
            <a href="https://github.com/parkervcp/eggs/commits?author=lilkingjr1" title="Maintains">🔨</a>
        </td>
        <td align="center">
            <a href="https://github.com/Moondarker">
                <img src="https://avatars.githubusercontent.com/u/4098364" width="50px;" alt=""/><br /><sub><b>Moondarker</b></sub>
            </a>
            <br />
            <a href="https://github.com/parkervcp/eggs/commits?author=Moondarker" title="Codes">💻</a>
            <a href="https://github.com/parkervcp/eggs/commits?author=Moondarker" title="Contributor">💡</a>
        </td>
        <td align="center">
            <a href="https://github.com/Brophy">
                <img src="https://avatars.githubusercontent.com/u/123881" width="50px;" alt=""/><br /><sub><b>Brophy</b></sub>
            </a>
            <br />
            <a href="https://github.com/parkervcp/eggs/commits?author=Brophy" title="Codes">💻</a>
            <a href="https://github.com/parkervcp/eggs/commits?author=Brophy" title="Contributor">💡</a>
        </td>
    </tr>
</table>
<!-- markdownlint-enable -->
<!-- prettier-ignore-end -->

___

### Game Description

From Bohemia Interactive's [Website](https://dayz.com/):
> How long can you survive a post-apocalyptic world? A land overrun with an infected "zombie" population, where you compete with other survivors for limited resources. Will you team up with strangers and stay strong together? Or play as a lone wolf to avoid betrayal? This is DayZ – this is your story.
___

### Egg Capabilities

- Able to download server updates on startup
- Able to download, update, and load Steam Workshop mods on startup (\*see [Installation/System Requirements](#installationsystem-requirements))
  - Also accepts server-side only mods.
  - Checks for mod updates against their Steam Workshop page's last update for quick and efficient update checks.
  - Automatically moves mod `.bikey`'s to the `/keys/` directory.
  - Note: These features only work with mods in the `@workshopID#` format. Manually uploaded mods are not automatically updated.
- Multiple basic settings found within the `serverDZ.cfg` file can be easily set from the server's Startup tab
  - Server name, passwords, disable third person, persistant time, and more...
- Max Players is configurable and able to be host enforced (\*see [Recommended Egg Modifications](#recommended-egg-modifications))
- Additional [DayZ startup parameters](https://community.bistudio.com/wiki/DayZ:Server_Configuration#Launch_Parameters) can be added to fine-tune performance
- [WHMCS](https://www.whmcs.com/) compatible (\*see [Recommended Egg Modifications](#recommended-egg-modifications))

___

### Server Ports

Default server ports are listed below, but all ports can be changed freely.

| Port | Default (UDP) |
|---------|---------|
| **DayZ Game (Main)** | 2302 |
| Steam Query | 27016 |

___

### Installation/System Requirements

> [!IMPORTANT]
> A real, valid Steam account is required to install this game server.

> [!WARNING]
> Steam Guard **must** be completely **turned off** for the server and mods to download efficiently. See [Running With Steam Guard Enabled](#running-with-steam-guard-enabled) for an unofficial workaround.

|  | Bare Minimum | Recommended |
|---------|---------|---------|
| Processor | Recent x86/64 (AMD/Intel) processor. No 32-bit or ARM support. | Avoid CPU Pinning; may cause issues. |
| RAM | 4096-5120 MiB | 8192 MiB |
| Storage | 3072 MiB | 7168+ MiB (depends on how many mods are installed) |
| Network | 0.512 Mbit/s/player | 1-5 Mbit/s/player |
| Host OS | Most stable Linux OS branches should work | Using the latest kernel version for your installed OS can prevent some edge-case installation/boot issues. |
| Game Ownership | Not required to install game server. | Required for automatic Steam Workshop mod downloading to work. However, this is optional functionality, and mods can be manually uploaded to the server if desired. Hosts may feel free to change the "Disable Mod Downloads/Updates" variable to `1` if they would not like to offer it's functionality to clients. |

___

### Recommended Egg Modifications

The following are highly recommended variable modifications you can make to the egg after importing it to your panel. While viewing this egg, simply go to the "Variables" tab of the egg editor to make these changes.

#### Default Steam Username & Password

- To make deploying servers easy (**or if you are using WHMCS**), it is recommended to edit the default values of "Steam Username" and "Steam Password" to your Steam account dedicated for hosting. This will make all newly installed servers use these credentials. **DO NOT** make these fields visible to the end user so that they can use their own Steam accounts; the panel will save their Steam credentials in **plain text**, which is a BIG NO NO for security and privacy.

#### Restrict Max Players

- If you would like to restrict the maximum number of players that can join your client's server, you can change the permissions of the "Max Players" variable so that clients can only view this value (and not edit it). It's default value can also be changed, or the value can be changed on a server-by-server basis as desired.

___

### Running With Steam Guard Enabled

> [!CAUTION]
> The following is ***highly discouraged*** for production environments or even private use. It should only be used if you *really* don't want to disable Steam Guard and don't plan on updating your server/mods often. Support will not be given to those with Steam Guard enabled. Additionally, using this method, you are at risk of rate limiting your account if something goes wrong.

1. Edit the Egg so the Input Rules of the "Steam Username" and "Steam Password" Variables are `nullable|string`.
2. Create a new server as normal, but set "Steam Username" to be `anonymous` and "Steam Password" to be blank. This will cause the installer to successfully install SteamCMD but fail to install the DayZ server; this is intentional.
3. Once the server is created, go to the Startup tab. Change "Steam Username" and "Steam Password" to be your real Steam account and password. Also, enable "[Repair] Validate Server Files" (this only needs to be enabled for the first boot).
4. Start the server. The console will eventually appear to freeze on the line: `Loading Steam API...OK`. You will likely receive a Steam Guard request for login at this time. Approve this request just to be safe, but this will not log you in. Next, obtain a valid Steam Guard code, enter it into the console, and press Enter to submit it. This should log you in. It is successful if you see: `Two-factor code:OK`. The server will then download for the first time. Note: It may glitch and not display installation progress; be patient while it downloads and verifies.
    - If you have mods to install, you will have to repeat this process of obtaining and entering in a *new* Steam Guard code for *every* mod.
5. Stop the server after it starts. Open the file `serverDZ.cfg` and add `steamQueryPort = 2305;` to the end of the file. (If the file was empty when you opened it for whatever reason, grab the default contents [here](https://community.bistudio.com/wiki/DayZ:Server_Configuration#Main_Parameters))
6. The server is now ready for a "normal" boot. However, it is recommended you disable the "Automatic Updates" Startup Variable until you need to update again. Otherwise, you will have to go through the process of entering in Steam Guard codes again every boot.
