# Inno Setup Script
### [What is Inno?](https://jrsoftware.org/isinfo.php)

This is a script I made to modify and update the [Jellyfin Media Player](https://github.com/jellyfin/jellyfin-media-player) configuration or files. The easy way.
> Includes Jellyfin Media Player installer for updates or fresh installs.

You can modify and [compile](https://github.com/Uncle-Tio/jellyfin-media-player-setup-script#compile) it to suit your needs.

# What the script does:

1. Run `JellyfinMediaPlayer-1.9.1-windows-x64.exe` with the parameter `/passive` (displays minimal UI with no prompts).
2. Place the `jellyfinmediaplayer.conf` file in the `C:\Users\YOURNAME\Appdata\Local\JellyfinMediaPlayer` folder.
3. Place the `main.jellyfin.bundle.js` file in the `C:\Program Files\Jellyfin\Jellyfin Media Player\web-client\desktop` folder.

> This script doesn't create its own uninstallers (JellyfinMediaPlayer does).

### Modifications made by the setup:
- In the embedded Web-client, `main.jellyfin.bundle.js` was modified:
<br>`enableBackdrops:function(){return P}` line was changed to `enableBackdrops:function(){return x}`.
> This enable the backdrops/background images.
- Replaces/creates settings file, replacements include:
> 1. Enable [Intro Skipper](https://github.com/ConfusedPolarBear/intro-skipper) and [Scrub plugins](https://github.com/nicknsy/jellyscrub).
> 2. Audio set to automatic.
> 3. Allow and prefer HEVC.
> 4. Disable external web-client if enabled.
- Embedded media player installer runs passively (no prompts and minimal UI).

## Showcase
![SetupShowcase](https://cdn.discordapp.com/attachments/1072678455478587462/1100083902242095154/Compil32_gHvN44oKpQ.gif)

# Compile

To compile the Jellyfin Media Player setup script, follow these steps:

1. Download and Install [Inno Setup](https://jrsoftware.org/isdl.php#stable).
2. [Download the repository](https://github.com/Uncle-Tio/jellyfin-media-player-setup-script/archive/refs/heads/main.zip).
3. Extract the files to `C:\ProjectInno\` (if you prefer not to readjust the paths).
4. Download the [original](https://github.com/jellyfin/jellyfin-media-player/releases/download/v1.9.1/JellyfinMediaPlayer-1.9.1-windows-x64.exe) setup, and extract it in the same folder.
5. Modify `main.jellyfin.bundle.js` or `jellyfinmediaplayer.conf` to suit your requirements.
6. Open `Setup Script.iss` and make any necessary modifications (if any).
7. Press F9, wait for the process to finish and test. Look for the Output folder and there is the new compiled setup.

If you need help, don't be shy :)
