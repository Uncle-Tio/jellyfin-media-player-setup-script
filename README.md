# Inno Setup Script
### [What is Inno?](https://jrsoftware.org/isinfo.php)

This is a script I made to modify and update the [Jellyfin Media Player](https://github.com/jellyfin/jellyfin-media-player) configuration or files. The easy way.
> Includes Jellyfin Media Player installer for updates or fresh installs.

You can modify and [compile](https://github.com/Uncle-Tio/jellyfin-media-player-setup-script#compile) it to suit your needs.

# What the script does:

1. Run `JellyfinMediaPlayer-1.9.1-windows-x64.exe` with the parameter `/passive /norestart` (minimal UI with no prompts).
2. Place the `jellyfinmediaplayer.conf` file in the `C:\Users\YOURNAME\Appdata\Local\JellyfinMediaPlayer` folder.
3. Place the `main.jellyfin.bundle.js` file in the `C:\Program Files\Jellyfin\Jellyfin Media Player\web-client\desktop` folder.

> This script doesn't create its own uninstallers (JellyfinMediaPlayer does).

### Modifications made by the setup:
- Updated embedded [Web-client](https://github.com/jellyfin/jellyfin/releases/tag/v10.8.13) (10.8.13)
 - `main.jellyfin.bundle.js` was modified:
   <br>`enableBackdrops:function(){return P}` line was changed to `enableBackdrops:function(){return x}`.
> This enable the backdrops/background images.
- Replaces/creates settings file, replacements include:
> 1. Enable [Intro Skipper](https://github.com/jumoog/intro-skipper) and [Scrub plugins](https://github.com/nicknsy/jellyscrub).
> 2. Audio set to automatic.
> 3. Allow and prefer HEVC.
> 4. Cache set to very large.
- Embedded media player installer runs passively (no prompts and minimal UI).

## Showcase
![SetupShowcase](https://i.imgur.com/DEYqZSK.gif)

# Compile

To compile yourself, follow these steps:

1. Download and Install [Inno Setup](https://jrsoftware.org/isdl.php#stable).
2. [Download the repository](https://github.com/Uncle-Tio/jellyfin-media-player-setup-script/archive/refs/heads/main.zip).
3. Extract the files to `C:\ProjectInno\` (if you prefer not to readjust the paths).
4. Download the [original](https://github.com/jellyfin/jellyfin-media-player/releases/download/v1.9.1/JellyfinMediaPlayer-1.9.1-windows-x64.exe) setup, and move to the same folder.

   > In the latest version I've included some corrections, if you want to include them too, [download this one](https://github.com/Uncle-Tio/jellyfin-media-player-beta/releases/tag/v1.9.1).
6. Modify `main.jellyfin.bundle.js`, `jellyfinmediaplayer.conf` and (optional) `mpv.conf` to suit your requirements.
7. Open `Setup Script.iss` and make any necessary modifications (if any).

   > Remove `;` in line 52 if you want to include mpv.conf
8. Press F9, wait for the process to finish and test. Look for the Output folder and there is the new compiled setup.
   > The Inno Setup Script needs to be opened as an administrator if you want to debug, the files will not be overwritten without.

If you need help, don't be shy :)
