; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "Libreosteo"
#define MyAppVersion "0.6.0"
#define MyAppPublisher "Libreosteo"
#define MyAppURL "http://libreosteo.github.io"
#define MyAppExeName "Libreosteo.exe"

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{829E22A4-261D-41D8-8987-30A8DD72E895}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={pf}\{#MyAppName}
DefaultGroupName={#MyAppName}
AllowNoIcons=yes
LicenseFile=C:\Users\jb\libreosteo\LICENCE.md
OutputBaseFilename=setup
Compression=lzma
SolidCompression=yes

[Languages]
Name: en; MessagesFile: "compiler:Default.isl"
Name: fr; MessagesFile: "compiler:Languages\French.isl"

[Files]
Source: "C:\Users\jb\libreosteo\build\exe.win32-2.7\Libreosteo.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\jb\libreosteo\build\exe.win32-2.7\manager.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\jb\libreosteo\build\exe.win32-2.7\*.*"; Excludes : "db.sqlite3*,access.log,errors.log,whoosh_index"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs
Source: "C:\Users\jb\libreosteo\build\exe.win32-2.7\Libreosteo.url"; DestDir: "{app}"
; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[Icons]
; Name: "{group}\{#MyAppName} (Service)"; Filename: "{app}\{#MyAppExeName}"
Name: "{group}\{#MyAppName}"; Filename: "{app}\Libreosteo.url" ; IconFilename : "{app}\static\images\icon.ico"
Name: "{group}\{cm:UninstallProgram,{#MyAppName}}"; Filename: "{uninstallexe}"
Name: "{userdesktop}\{#MyAppName}"; Filename: "{app}\Libreosteo.url"; \
    IconFilename: "{app}\static\images\icon.ico"; Tasks: desktopicon

[CustomMessages]
; Fran�ais
fr.mainusertitle=Utilisateur principal
fr.mainusersubtitle=D�finition de l''utilisateur principal
fr.mainuserdescription=Saisissez les informations de l''utilisateur principal de Libreosteo
fr.login=Login :
fr.password=Mot de passe :
fr.inituser=Initialiser l'utilisateur principal  (nouvelle installation uniquement)
fr.installingdb=Installation ou mise � jour de la base de donn�es
fr.installinguser=Cr�ation de l'utilisateur principal
fr.installingservice=Installation du service
fr.startingservice=D�marrage du service
fr.uninstallingservice=D�sinstallation du service

;English
en.mainusertitle=Main user
en.mainusersubtitle=Description of the main user
en.mainuserdescription=Edit information about the main user of Libreosteo
en.login=Login :
en.password=Password :
en.inituser=Init the main user (new installation only)
en.installingdb=Installing or updating database
en.installinguser=Creating the main user
en.installingservice=Installing the service
en.startingservice=Starting the service
en.uninstallingservice=Uninstalling the service


[Run]
Filename: "{app}\Libreosteo.exe"; Parameters: "stop"; StatusMsg: "{cm:uninstallingservice}"; Flags: runhidden
Filename: "{app}\manager.exe"; Parameters: "migrate"; StatusMsg: "{cm:installingdb}"; Flags: runhidden;
Filename: "{app}\Libreosteo.exe"; Parameters: "--startup auto install"; StatusMsg: "{cm:installingservice}"; Flags: runhidden
Filename: "{app}\Libreosteo.exe"; Parameters: "start"; StatusMsg: "{cm:installingservice}"; Flags: runhidden

[UninstallRun]
Filename: "{app}\Libreosteo.exe"; Parameters: "stop"; StatusMsg: "{cm:uninstallingservice}"; Flags: runhidden
Filename: "{app}\Libreosteo.exe"; Parameters: "remove"; StatusMsg: "{cm:uninstallingservice}"; Flags: runhidden

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; \
    GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked
