#define MyAppName "Jellyfin"
#define MyAppVersion "1.10.0 - Inno v1.3"
#define MyAppPublisher "Jellyfin"
#define MyAppURL "https://github.com/jellyfin/jellyfin-media-player"
#define MyAppExeName "JellyfinMediaPlayer.exe"

[Setup]
; NOTE: The value of AppId uniquely identifies this application. Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={BF80511B-E161-4D0A-8B63-BCB7284D31D6}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
CreateAppDir=no
InfoBeforeFile="C:\ProjectFolder\Welcome Text [eng].txt"
; Uncomment the following line to run in non administrative install mode (install for current user only.)
;PrivilegesRequired=lowest
OutputBaseFilename="Jellyfin Media Player 1.10.0 - Inno 1.3.0"
SetupIconFile="C:\ProjectFolder\icon-transparent.ico"
Compression=none
WizardStyle=modern
DisableReadyPage=yes
Uninstallable=no
ShowLanguageDialog=auto
ArchitecturesInstallIn64BitMode=x64
RestartIfNeededByRun=False
AllowCancelDuringInstall=False
VersionInfoVersion=1.3.5.0

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Files]
; Extract Jellyfin Media Player Setup (Windows temp folder)
Source: "C:\ProjectFolder\JellyfinMediaPlayer-1.10.0-windows-x64.exe"; DestDir: "{tmp}";
; Extract jellyfinmediaplayer.conf (Windows temp folder)
Source: "C:\ProjectFolder\jellyfinmediaplayer.conf"; DestDir: "{tmp}"; Flags: ignoreversion
; Extract main.jellyfin.bundle.js (Windows temp folder)
Source: "C:\ProjectFolder\main.jellyfin.bundle.js"; DestDir: "{tmp}"; Flags: ignoreversion
; Extract mpv.conf (Windows temp folder)
; Source: "C:\ProjectFolder\mpv.conf"; DestDir: "{tmp}"; Flags: ignoreversion

[Run]
Filename: "{tmp}\JellyfinMediaPlayer-1.10.0-windows-x64.exe"; Parameters: "/passive /norestart"; Flags: waituntilterminated

Filename: "{sys}\cmd"; Parameters: "/C move /Y ""{tmp}\jellyfinmediaplayer.conf"" ""{localappdata}\JellyfinMediaPlayer\"""; Flags: runhidden
Filename: "{sys}\cmd"; Parameters: "/C move /Y ""{tmp}\main.jellyfin.bundle.js"" ""{commonpf64}\Jellyfin\Jellyfin Media Player\web-client\desktop\"""; Flags: runhidden
; Filename: "{sys}\cmd"; Parameters: "move /Y ""{tmp}\mpv.conf"" ""{localappdata}\JellyfinMediaPlayer\"""; Flags: runhidden
; /C = execute a command and then close the command prompt.
; /Y = automatically replace the destination file if it already exists.
; replace 'move' with 'copy' and remove the /Y if you don't want it replaced.
