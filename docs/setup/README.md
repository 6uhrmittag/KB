# Tools to install

# via patchmypc

see https://patchmypc.com/home-updater-download

- Foxit Reader
- ImageGlass
- Notepad++
- Dropbox
- Git version
- GitHub Desktop
- Google Chrome
- Microsoft Visual C++ 2010 x64 Redistributable
- Microsoft Visual C++ 2010 x86 Redistributable
- Microsoft Visual C++ 2012 Redistributable (x64)
- Microsoft Visual C++ 2012 Redistributable (x86)
- Mozilla Firefox
- TeraCopy version
- TreeSize Free
- VLC media player
- WinRAR
- Wireshark

# manual setup

- Vagrant
- Virtualbox (Check Version - must work with Vagrant)
- [KiTTY](http://kitty.9bis.net/)
- Pycharms via jetbrains-toolbox
- https://www.binisoft.org/wfc
- https://github.com/jimradford/superputty
- https://portal.office.com/account
- https://sourceforge.net/projects/vcxsrv/
- https://www.samsung.com/semiconductor/minisite/ssd/product/consumer/magician/
- https://mpv.io/installation/

## via scoop (optional)

- https://github.com/lukesampson/scoop
- https://rasa.github.io/scoop-directory/by-stars

### install & setup scoop
````powershell
iwr -useb get.scoop.sh | iex
scoop install sudo # to use --global
scoop install aria2 # better download performance
sudo Add-MpPreference -ExclusionPath 'C:\Users\marvin\scoop'
sudo Add-MpPreference -ExclusionPath 'C:\ProgramData\scoop'
scoop install 7zip
scoop install innounp 
scoop install dark
scoop checkup

scoop bucket add scoop-completion https://github.com/Moeologist/scoop-completion
````

````powershell
scoop bucket add extras # add more Tools
scoop bucket add nirsoft # add nirsoft systemtools
scoop bucket add Sysinternals 'https://github.com/Ash258/Scoop-Sysinternals.git' # add sysinternal tools
scoop bucket add Ash258 'https://github.com/Ash258/Scoop-Ash258.git' # add more 3rd party tools
scoop install ProcessExplorer  
scoop install ProcessMonitor
scoop install screentogif
scoop install less
````

#### optional

````powershell
scoop install typora
scoop install JetBrains-Toolbox
scoop install mysql-workbench
scoop install heidisql
scoop install hosts-file-editor
scoop install screentogif
scoop install FullEventLogView
````

#### Usage

````powershell
scoop list
scoop install <app>
sudo scoop install --global <app>
scoop update
scoop update <app>
scoop uninstall <app>
````

## manual config
### Putty

- https://github.com/jacktrocinski/pretty-putty
    - **Note:** Will change mouse-shortcut `right-click to paste/insert` to wheel-click! change after import back to right-click(Win default)

### Jetbrains IDE
- https://developpaper.com/using-typora-to-edit-markdown-file-in-pycharm/

## Powershell
### Install Preview 7
Install Powershell 7 via WinStore

### Create Profile
````powershell
if (!(Test-Path -Path $PROFILE ))
{ New-Item -Type File -Path $PROFILE -Force }
````
### Init 

````powershell
Set-PSRepository -name PSGallery -InstallationPolicy Trusted
Install-Module -Name PSReadLine -AllowPrerelease -Force
````
### Copy Profile
````powershell
notepad.exe $PROFILE
````
Copy content from: https://raw.githubusercontent.com/6uhrmittag/KB/master/docs/setup/windows/Microsoft.PowerShell_profile.ps1

## Terminal
### Install
Windows Terminal Preview: https://aka.ms/terminal

### Settings
Move needed parts in settings.json (via Terminal -> Settings): https://raw.githubusercontent.com/6uhrmittag/KB/master/docs/setup/windows/terminal/settings.json

## Experimental

### XServer Alternative

- install `GWSL` from MS Store

# Optional/Not 100% reviewed yet

- https://www.microsoft.com/en-us/p/openinwsl/9ngmqpwcg7sf?cid=msft_web_chart&activetab=pivot:overviewtab
- https://www.microsoft.com/en-us/p/windows-performance-analyzer/9n0w1b2bxgnz?cid=msft_web_chart&activetab=pivot:overviewtab
- https://www.microsoft.com/en-us/p/gwsl/9nl6kd1h33v3?activetab=pivot:overviewtab
  - https://opticos.github.io/gwsl/
- https://www.jetbrains.com/lp/mono/#how-to-install


## winget (experimental)

-> doesnt really work. will run winget as admin.. installs user programms to admin  
Skip UAC:
https://github.com/microsoft/winget-cli/issues/271#issuecomment-943002770
````powershell
winget install gerardog.gsudo
````
gsudo cache on
gsudo cache off
gsudo -k

````powershell
winget install -e Microsoft.WindowsTerminal.Preview
winget install -e Typora.Typora
# aktuell via scoop
winget install -e --id HeidiSQL.HeidiSQL
winget install -e --id BraveSoftware.BraveBrowser
winget install -e --id NickeManarin.ScreenToGif
winget install -e --id Wox.Wox
winget install -e --id voidtools.Everything
winget install -e --id TorProject.TorBrowser
winget install -e --id CodeSector.TeraCopy
winget install -e --id DuongDieuPhap.ImageGlass
winget install -e --id scottlerch.hosts-file-editor
winget install -e --id Mirantis.Lens
winget install -e --id Beeftext.Beeftext
winget install -e --id JohnMacFarlane.Pandoc
winget install -e --id=Microsoft.Teams.Preview
````


````powershell
winget uninstall -e Microsoft.WindowsTerminal
````
