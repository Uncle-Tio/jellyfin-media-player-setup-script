#define MyAppName "Jellyfin"
#define MyAppVersion "1.9.1 - Inno v1.2"
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
InfoBeforeFile="C:\ProjectFolder\Welcome Text [eng].txt"
; Uncomment the following line to run in non administrative install mode (install for current user only.)
;PrivilegesRequired=lowest
OutputBaseFilename=JellyfinMediaPlayer-1.9.1-Inno-English
SetupIconFile="C:\ProjectFolder\icon-transparent.ico"
Compression=none
WizardStyle=modern
DisableReadyPage=yes
Uninstallable=no
ShowLanguageDialog=auto
ArchitecturesInstallIn64BitMode=x64
RestartIfNeededByRun=False
AllowCancelDuringInstall=False
VersionInfoVersion=1.2.0.0

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Files]
; Extract Jellyfin Media Player Setup (Windows temp folder)
Source: "C:\ProjectFolder\JellyfinMediaPlayer-1.9.1-windows-x64.exe"; DestDir: "{tmp}";
; Extract jellyfinmediaplayer.conf (Windows temp folder)
Source: "C:\ProjectFolder\jellyfinmediaplayer.conf"; DestDir: "{tmp}"; Flags: ignoreversion
; Extract main.jellyfin.bundle.js (Windows temp folder)
Source: "C:\ProjectFolder\main.jellyfin.bundle.js"; DestDir: "{tmp}"; Flags: ignoreversion

[Code]
// Function to copy a file
function CopyFile(Source, Dest: String): Boolean;
begin
  Result := True;
  try
    ForceDirectories(ExtractFilePath(Dest));  // Make sure the destination directory exists
    if FileExists(Dest) then                  // (to disable overwrite, remove this line, the one above and the one below)
      DeleteFile(Dest);                       // Delete existing file
    FileCopy(Source, Dest, False);
  except
    Result := False;
  end;
end;

[Run]
Filename: "{tmp}\JellyfinMediaPlayer-1.9.1-windows-x64.exe"; Parameters: "/passive /norestart"; AfterInstall: CopyFiles

[Code]
// Function to copy files after installation
procedure CopyFiles;
begin
  // Copy jellyfinmediaplayer.conf to {localappdata}\JellyfinMediaPlayer
  if not CopyFile(ExpandConstant('{tmp}\jellyfinmediaplayer.conf'), ExpandConstant('{localappdata}\JellyfinMediaPlayer\jellyfinmediaplayer.conf')) then
    MsgBox('Error copying jellyfinmediaplayer.conf', mbError, MB_OK);
  
  // Copy main.jellyfin.bundle.js to C:\Program Files\Jellyfin\Jellyfin Media Player\web-client\desktop
  if not CopyFile(ExpandConstant('{tmp}\main.jellyfin.bundle.js'), ExpandConstant('{commonpf64}\Jellyfin\Jellyfin Media Player\web-client\desktop\main.jellyfin.bundle.js')) then
    MsgBox('Error copying main.jellyfin.bundle.js', mbError, MB_OK);
end;
