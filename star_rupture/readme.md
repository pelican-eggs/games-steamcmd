# Star Rupture

> [!IMPORTANT]
> Keep in mind that the game is still in EARLY ACCESS

StarRupture is a first-person open world base-building game with advanced combat and tons of exploration. Play alone or in a group on this sublime and ever-changing planet, extract and manage resources, create your complex industrial system and fight off hordes of alien monsters. Developed by Creepy Jar.

## Required Ports

|Port|default|          |
|----|-------|----------|
|7777|Game| madatory |
|27015|ServerQuery| optional |

## Installing the server

When using the egg to create the server and if this is the first time you install the game, ensure that the "create new game" variable is set to **true** and the "load saved game" variable to **false**.

Launch the server creation and wait for the installation to finish.

When the installation is done stop the server.

Set the "load saved game" variable to **true** while setting the "create new game" variable to **false**

> [!IMPORTANT]
> If you want to password protect the game session follow the instructions below

1. Go to https://starrupture-utilities.com/passwords/
2. Enter a strong password into the Player Join Password field
3. Click "Encrypt"
4. Copy the json content (use the "Copy PlayerPassword.json" button)
5. Use the Files explorer of the pterodactyl/pelican server and create a file named "PlayerPassword.json" in the server root
6. Paste the json content into the file

> [!IMPORTANT]
> If you want to password protect the server management (disabled for now) follow the instructions below

1. Go to https://starrupture-utilities.com/passwords/
2. Enter a strong password into the Admin Password field
3. Click "Encrypt"
4. Copy the json content (use the "Copy Password.json" button)
5. Use the Files explorer of the pterodactyl/pelican server and create a file named "Password.json" in the server root
6. Paste the json content into the file

**Launch the game an enjoy !**

> [!IMPORTANT]
> Keep in mind that the game is still in EARLY ACCESS
> All the necessary debugging informations are available in this discussion: [https://steamcommunity.com/app/1631270/discussions/0/684116375920420939](https://steamcommunity.com/app/1631270/discussions/0/684116375920420939)
> You can also read the dedicated page in this unofficial wiki: https://wiki.starrupture-utilities.com/en/dedicated-server
