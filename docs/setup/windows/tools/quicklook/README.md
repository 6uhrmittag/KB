# Quicklook

Tool: https://github.com/QL-Win/QuickLook

## Autostart

````powershell
$QuickLookPath = "$env:LOCALAPPDATA\Programs\QuickLook\QuickLook.exe"
$StartupFolder = "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Startup"
$ShortcutPath = "$StartupFolder\QuickLook.lnk"
$WScriptShell = New-Object -ComObject WScript.Shell
$Shortcut = $WScriptShell.CreateShortcut($ShortcutPath)
$Shortcut.TargetPath = $QuickLookPath
$Shortcut.Arguments = "/autorun"
$Shortcut.Save()
````

## Plugins

see: https://github.com/QL-Win/QuickLook/wiki/Available-Plugins

````powershell
cd $env:APPDATA\pooi.moe\QuickLook\
Invoke-WebRequest -Uri https://github.com/adyanth/QuickLook.Plugin.FolderViewer/releases/download/1.3/QuickLook.Plugin.FolderViewer.qlplugin -OutFile QuickLook.Plugin.FolderViewer.qlplugin
````

