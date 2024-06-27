# Inno Setup Script

⚠️ It's no longer possible to activate backdrops in the Media Player's internal web-client, now you have to do it in the server's web-client.
- Theoretically, you need to modify `main.jellyfin.bundle.js` on `~\Jellyfin\jellyfin-web`.
  <br>`enableBackdrops:function(){return _}` change to `{return x}`.
But I don't know if it still works, you can compile the web to force it always active, take a look [here](https://github.com/Uncle-Tio/jweb-fork/commits/release-10.9.z?author=Uncle-Tio). Bear in mind that I'm not a dev. There must be a better way of doing it.

This setup has lost some of its usefulness as I've found better ways to get what I want, but I'll keep it around in case anyone still finds it useful.

### [What is Inno?](https://jrsoftware.org/isinfo.php)

This is a script I made to modify and update the [Jellyfin Media Player](https://github.com/jellyfin/jellyfin-media-player) configuration or files. The easy way.
> Includes Jellyfin Media Player installer for updates or fresh installs.

You can/should modify and [compile](https://github.com/Uncle-Tio/jellyfin-media-player-setup-script#compile) it to suit your needs. This is just a base and a very noob-friendly way of doing things.

# What the script does:

1. Run `JellyfinMediaPlayer-(Version)-windows-x64.exe` with the parameter `/passive /norestart` (minimal UI with no prompts).
> This script doesn't create its own uninstallers.
2. Place the `jellyfinmediaplayer.conf` file in the `C:\Users\YOURNAME\Appdata\Local\JellyfinMediaPlayer` folder.

### Modifications made by the setup:
- Replaces/creates settings file, replacements include:
> 1. Enable [Intro Skipper](https://github.com/jumoog/intro-skipper).
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
4. Download the original setup, and move to the same folder.
6. Modify `main.jellyfin.bundle.js`, `jellyfinmediaplayer.conf` and (optional) `mpv.conf` to suit your requirements.
7. Open `Setup Script.iss` and make any necessary modifications (if any).

   > Remove `;` in line 52 if you want to include mpv.conf
8. Press F9, wait for the process to finish and test. Look for the Output folder and there is the new compiled setup.
   > The Inno Setup Script needs to be opened as an administrator if you want to debug, the files will not be overwritten without.

If you need help, don't be shy :)
