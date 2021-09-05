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
- Terminal/Powershell AddOn [/setup/windows/terminal/](/setup/windows/terminal/)
- https://mpv.io/installation/

# Via WindowsStore

- Windows Terminal: https://aka.ms/terminal
    - https://www.microsoft.com/en-us/p/windows-terminal-preview/9n8g5rfz9xk3?activetab=pivot:overviewtab

# manual setup optional

- ScreenToGif: https://www.screentogif.com/
- Hosts File Editor: https://hostsfileeditor.com/

# manual config

## Putty

- https://github.com/jacktrocinski/pretty-putty
    - **Note:** Will change mouse-shortcut `right-click to paste/insert` to wheel-click! change after import back to right-click(Win default)

## via scoop (optional)

- https://github.com/lukesampson/scoop
- https://rasa.github.io/scoop-directory/by-stars

All Commands in Powershell
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

# Jetbrains IDE

- https://developpaper.com/using-typora-to-edit-markdown-file-in-pycharm/

# Optional/Not 100% reviewed yet

- https://www.microsoft.com/en-us/p/openinwsl/9ngmqpwcg7sf?cid=msft_web_chart&activetab=pivot:overviewtab
- https://www.microsoft.com/en-us/p/windows-performance-analyzer/9n0w1b2bxgnz?cid=msft_web_chart&activetab=pivot:overviewtab
- https://www.microsoft.com/en-us/p/gwsl/9nl6kd1h33v3?activetab=pivot:overviewtab
  - https://opticos.github.io/gwsl/
- https://www.jetbrains.com/lp/mono/#how-to-install
- 
## Powershell (Experimental)

https://devblogs.microsoft.com/powershell/announcing-psreadline-2-1-with-predictive-intellisense/?WT.mc_id=modinfra-16469-thmaure
````powershell

if (!(Test-Path -Path $PROFILE ))
{ New-Item -Type File -Path $PROFILE -Force }

Set-PSRepository -name PSGallery -InstallationPolicy Trusted

#https://github.com/Pscx/Pscx
Install-Module Pscx -Scope CurrentUser -AllowClobber



Install-Module -Name PSReadLine -AllowPrerelease -Force
````

## Powershell profile

Install Powershell Preview via MS Store
````powershell
notepad.exe $PROFILE
````
Copy content: [Microsoft.PowerShell_profile.ps1](Microsoft.PowerShell_profile.ps1)

