#define MyAppName "Jellyfin"
#define MyAppVersion "1.9.1-Inno"
#define MyAppPublisher "Jellyfin"
#define MyAppURL "https://github.com/jellyfin/jellyfin-media-player"
#define MyAppExeName "JellyfinMediaPlayer.exe"

[Setup]
; NOTE: The value of AppId uniquely identifies this application. Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{BF80511B-E161-4D0A-8B63-BCB7284D31D6}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
CreateAppDir=no
InfoBeforeFile=C:\ProjectFolder\Pre-Setup-ENG.txt
; Uncomment the following line to run in non administrative install mode (install for current user only.)
;PrivilegesRequired=lowest
OutputBaseFilename=JellyfinMediaPlayer-1.9.1-Inno-English
SetupIconFile=C:\ProjectFolder\icon-transparent.ico
Compression=none
SolidCompression=yes
WizardStyle=modern
DisableReadyPage=yes
Uninstallable=no
ShowLanguageDialog=auto
LanguageDetectionMethod=locale
ArchitecturesInstallIn64BitMode=x64
RestartIfNeededByRun=False
AllowCancelDuringInstall=False
VersionInfoVersion=1.1.0.0

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Run]
Filename: "{tmp}\JellyfinMediaPlayer-1.9.1-windows-x64.exe"; Parameters: "/passive"

[Files]
Source: "C:\ProjectFolder\jellyfinmediaplayer.conf"; DestDir: "{localappdata}\JellyfinMediaPlayer"; Flags: ignoreversion
Source: "C:\ProjectFolder\main.jellyfin.bundle.js"; DestDir: "C:\Program Files\Jellyfin\Jellyfin Media Player\web-client\desktop"; Flags: ignoreversion
Source: "C:\ProjectFolder\JellyfinMediaPlayer-1.9.1-windows-x64.exe"; DestDir: "{tmp}";
; NOTE: Don't use "Flags: ignoreversion" on any shared system files