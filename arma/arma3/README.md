# Arma 3

> [!IMPORTANT]
> **(September 2025) *This Egg has just been majorly updated.*** Please see [How to Update Egg](#how-to-update-egg) to avoid any migration issues!
___

## Authors / Contributors

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
            <a href="https://github.com/aussieserverhosts">
                <img src="https://avatars.githubusercontent.com/u/65438932" width="50px;" alt=""/><br /><sub><b>Aussie Server Hosts</b></sub>
            </a>
            <br />
            <a href="https://github.com/pelican-eggs/games-steamcmd/commits?author=aussieserverhosts" title="Codes">💻</a>
            <a href="https://github.com/pelican-eggs/games-steamcmd/commits?author=aussieserverhosts" title="Contributor">💡</a>
        </td>
        <td align="center">
            <a href="https://github.com/IAmSilK">
                <img src="https://avatars.githubusercontent.com/u/16708907" width="50px;" alt=""/><br /><sub><b>IAmSilK</b></sub>
            </a>
            <br />
            <a href="https://github.com/pelican-eggs/games-steamcmd/commits?author=IAmSilK" title="Codes">💻</a>
            <a href="https://github.com/pelican-eggs/games-steamcmd/commits?author=IAmSilK" title="Contributor">💡</a>
        </td>
        <td align="center">
            <a href="https://github.com/Yomanz">
                <img src="https://avatars.githubusercontent.com/u/5119107" width="50px;" alt=""/><br /><sub><b>Daave</b></sub>
            </a>
            <br />
            <a href="https://github.com/pelican-eggs/games-steamcmd/commits?author=Yomanz" title="Codes">💻</a>
            <a href="https://github.com/pelican-eggs/games-steamcmd/commits?author=Yomanz" title="Original Creator">⭐</a>
            <a href="https://github.com/pelican-eggs/games-steamcmd/commits?author=Yomanz" title="Retired from Development">💤</a>
        </td>
    </tr>
</table>
<!-- markdownlint-enable -->
<!-- prettier-ignore-end -->

___

### Game Description

From Bohemia Interactive's [Website](https://arma3.com/):
> Experience true combat gameplay in a massive military sandbox. Deploying a wide variety of single and multiplayer content, over 20 vehicles and 40 weapons, and limitless opportunities for content creation, this is the PC’s premier military game. Authentic, diverse, open - Arma 3 sends you to war.
___

### Egg Capabilities

- Configurable to run 32 or 64-bit versions of the server
- Max Players is configurable and able to be host enforced (\*see [Recommended Egg Modifications](#recommended-egg-modifications))
- Able to download server updates on startup
- Able to download, update, and load Steam Workshop mods on startup (\*see [Installation Requirements](#installationsystem-requirements))
  - Accepts uploaded HTML modlist files exported from the Arma 3 Launcher to define mods to load on the server.
  - Also accepts manually listed mods, CDLCs, server-side only mods, and optional client-side only mods.
  - Checks for mod updates against their Steam Workshop page's last update for quick and efficient update checks.
  - Automatically moves mod `.bikey`'s to the `/keys/` directory.
- Configurable to download Creator DLCs (`creatordlc` branch)
- Configurable to run Profiling/Performance binaries of the server (if desired; advanced users only)
- Most popular [Arma 3 startup parameters](https://community.bistudio.com/wiki/Arma_3_Startup_Parameters) can be added via Startup Variables.
- Configurable to run up to 5 Headless Clients in parallel with the main server (may require additional performance overhead)
- Configurable to allow remote RCon connections
- [WHMCS](https://www.whmcs.com/) compatible (\*see [Recommended Egg Modifications](#recommended-egg-modifications))

___

### Installation/System Requirements

> [!IMPORTANT]
> - A valid, **real** Steam account, with **Steam Guard turned off**, is required to install the server (default "anonymous" login cannot be used). This account *does not* need to own Arma 3 (unless downloading mods; see below). For security reasons it is [recommended by Valve](https://developer.valvesoftware.com/wiki/SteamCMD#With_a_Steam_account) that you create a new Steam account just for your dedicated servers.
> - For automatic Steam Workshop **mod downloading** to work, the Steam account ***does*** need to ****own Arma 3**. However, this is optional functionality, and mods can be manually uploaded to the server if desired. See [Recommended Egg Modifications](#recommended-egg-modifications) if you would like to disable mod downloading.

|  | Bare Minimum | Recommended | Notes |
|---------|---------|---------|---------|
| Processor | 2.4 GHz Dual-Core x86-64-v3. No ARM support. | 3.5+ GHz Quad-Core | ARMA 3 is mainly CPU intensive. Contrary to popular belief, the server binary *can* run on multiple cores/threads. However, it's ability to manage asynchronous tasks and hyperthread is somewhat limited, meaning additional cores/threads reach diminishing returns very quickly. In addition, it's ability to utilize all of the CPU allotted to it for AI processing seems to be limited as well. Therefore, a Headless Client ***and*** a properly written mission file are highly recommended if large amounts of AI units will be used. |
| RAM | 2048 MiB | 4096 MiB | If used, every Headless Client uses an additional 2048 MB of RAM as well. |
| Storage | 32 GB HDD | 50+ GB SSD | Mods can drastically increase usage if many are downloaded. |
| Network | 0.512 Mbit/s/player | 1-5 Mbit/s/player | Arma 3 server does not support IPv6 or DSlite IPv4 via IPv6 tunnel. You must have a real IPv4 connection. Multihome (ie. host with multiple WAN IPs) is not supported. |
| Host OS | Most stable Linux OS branches should work. | Using the latest kernel version for your installed OS can prevent some edge-case installation/boot issues. |

> [!WARNING]
> It has recently been found that newer CPUs with "efficiency cores" can sometimes cause major issues with Arma's performance. If Arma arbitrarily chooses to use any of these cores, this issue can occur.\
> \
> This issue **should not** be fixed by telling the panel to pin the server to specific CPU cores as this has caused issues in the past. Instead, hosts should manually add the [`-cpuCount`](https://community.bistudio.com/wiki/Arma_3:_Startup_Parameters#cpuCount) or [`-cpuAffinity`](https://community.bistudio.com/wiki/Arma_3:_Startup_Parameters#cpuAffinity) flag to the Startup Command of the Egg/Server.\
> \
> Which one you should use depends on where your efficiency cores are indexed for your CPU model. Examples for a 24-core CPU:
> - Cores 0 to 7 are efficiency cores: `-cpuAffinity=0xFFFF00` (use cores 8-24)
> - Cores 16 to 23 are efficiency cores: `-cpuCount=16` (use cores 0-15)

> [!NOTE]
> This Egg no longer supports the Wisp SaaS Panel.

___

### Server Ports

> [!TIP]
> - Default server ports are listed below, but the Main port can be any port.
> - There are three more ports after the Main port that are relative to the Main port (For example: The BattlEye port is always 4 ports higher than the Main port).
> - It is [recommended](https://community.bistudio.com/wiki/Arma_3:_Dedicated_Server#Port_Forwarding) that each server on a single host be 100 ports separate from each other.

| Port | Default | Protocol | Required | Notes |
|---------|---------|---------|---------|---------|
| **Arma 3 Game & VON** | 2302 | UDP | **Yes** | Must be **Primary** port in panel. |
| Steam Query (+1) | 2303 | UDP | **Yes** | |
| Steam Port (+2) | 2304 | UDP | **Yes** | |
| VON  (+3) | 2305 | UDP | No | No need to forward; currently depreciated. |
| BattleEye traffic (+4) | 2306 | UDP | **Yes** | |
| BattleEye RCon | 2301 | UDP | No | Can be any port, except for those listed above (including +3). |

___

### Mounting Workshop Mods

Server hosts may wish to save space and avoid download issues by mounting large and/or common mods. Unfortunately, Arma only allows mods to be loaded from directories down-stream of the server binary (ie. `/home/container/*`). This makes properly mounting the mod directories tricky. I have tried both mounting the mod folder directly into the `container` directory, and mounting into `/` (root) with a symlink to the folder placed in `container`. In both scenarios, `ls` showed files were mounted properly, but Arma was not able to see the folder for some reason. If anyone knows a solution to this, please open an Issue to let us know. I have a feeling it might be permissions related to NSS Wrapper, but I'm not sure.

___

### Recommended Egg Modifications

The following are highly recommended Startup Variable modifications you can make to the Egg after importing it to your panel. While viewing this Egg, simply go to the "Variables" tab of the Egg editor to make these changes.

#### Default Steam Username & Password

- To make deploying servers easy (**or if you are using WHMCS**), it is recommended to edit the default values of "Steam Username" and "Steam Password" to your Steam account dedicated for hosting. This will make all newly installed servers use these credentials. **DO NOT** make these fields visible to the end user so that they can use their own Steam accounts; the panel will save their Steam credentials in **plain text**, which is a BIG NO NO for security and privacy.

#### Restrict Max Players

- If you would like to restrict the maximum number of players that can join your client's server, you can change the permissions of the "Max Players" variable so that clients can only view this value (and not edit it). It's default value can also be changed, or the value can be changed on a server-by-server basis as desired.

#### Disable Mod Downloads/Updates

- If the Steam account does not own Arma 3, attempts to download mods will fail. If you would like to prevent end-users from downloading mods, simply delete the following Startup Variables:
    - "Modlist File (Exported from A3 Launcher)"
    - "Additional Mods"
    - "[Advanced] Server-Side Only Mods"
    - "[Advanced] Optional Client-Side Mods"

___

### How to Update Egg

If you already have an Arma 3 Egg installed on your panel, there are a couple things to consider after updating this Egg:

#### September 2025 Update

- Please **delete all existing mod folders** and have the system download and install them again. The mod management system was completely rehauled, and there is unfortunately no easy way to convert the mod files of the old system to the new system. Appologies for this, but the new system will dramatically reduce mod download errors.
- If you are still getting the "Your Arma 3 Egg is outdated and no longer supported" error after updating the Egg, please toggle the "Disable Verbose Logging" startup variable on or off once for every server that is using this Egg. This is due to a small bug in the panel where default values for new variables are set to `null` instead of their defaults.
- If you use a custom Arma3Profile file, **its location and name has changed**. You can move the contents of your old Arma3Profile to its new location at: `/home/container/.local/share/Arma 3 - Other Profiles/server/server.Arma3Profile`
- The Startup Command has changed, but does not update across all your existing servers. Servers will still boot with their old Startup Command, but will not operate as intended. Servers will have to be manually updated to the new Startup Command via the Startup tab.

#### Pterodactyl specific
- Startup Variables have been completely re-hauled. While most existing variables have retained their Environment Variable names, some have been completely changed or removed. Simply updating your existing Egg with this Egg may lead to Startup Variables being terribly out of order and cluttered. Therefore, the following steps are recommended to avoid this:
  1. Inform your end-users that some Startup Variable values may be lost and must be reconfigured.
  2. Change the name of your existing Arma 3 Egg to "Arma 3 (Old)".
  3. Import this updated Egg.
  4. Make any Egg modifications you would like. (\*see [Recommended Egg Modifications](#recommended-egg-modifications))
  5. Change all existing Arma 3 servers to the new Egg via the Startup tab.
  6. Delete the old Egg.
