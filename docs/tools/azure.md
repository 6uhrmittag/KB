# azure/azure AD

## test environment

````powershell
winget install --id = Hashicorp.Vagrant  -e
````

````powershell
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All
````

Vagrantfile

````yaml
Vagrant.configure(2) do |config|
config.vm.box = "gusztavvargadr/windows-10"

config.vm.guest = :windows
config.vm.boot_timeout = 600

  # config.vm.communicator = 'winrm'
  # config.winssh.shell = 'powershell'

config.vm.provider 'hyperv' do |h|
h.vmname = "test-vm-#{rand(01..99)}"
h.cpus = 2
h.memory = 4096
h.ip_address_timeout = 600
end
end
````

## scenarios

### install winget apps

- https://www.getrubix.com/blog/intune-and-package-managers-part-2-winget
- https://www.reddit.com/r/Intune/comments/rb6tr9/winget_and_win32app_package_creation_form/

#### auto update winget apps

https://call4cloud.nl/2021/05/cloudy-with-a-chance-of-winget/

### generate/export intune documentation

https://www.wpninjas.ch/2019/12/updated-automatic-intune-documentation/

## ressources

### script collections

https://github.com/aaronparker/intune
https://github.com/nickrod518/PowerShell-Scripts

### scripts

- find device
    - https://github.com/aaronparker/intune/blob/main/Devices/Find-Device.ps1
- force ms store update
    - https://github.com/aaronparker/intune/blob/main/Apps/windows/Invoke-StoreUpdate.ps1

## tricks

https://github.com/nicolonsky/ModernWorkplaceConcierge/wiki

### random

- microsoft365 as code (by microsoft)
    - https://github.com/microsoft/Microsoft365DSC
- intune gui
    - https://github.com/Micke-K/IntuneManagement
- https://www.wpninjas.ch/tools/
- force intune sync
    - https://oliverkieselbach.com/2020/11/03/triggering-intune-management-extension-ime-sync/
    - https://oofhours.com/2019/09/28/forcing-an-mdm-sync-from-a-windows-10-client/
- intro to mdm
    - https://www.thelazyadministrator.com/2018/11/19/configure-and-deploy-intune-mdm/

### testing

- generate hyperv VMs
    - https://github.com/tabs-not-spaces/Intune.HV.Tools

### deployment

#### create usb stick for autopilot

https://powers-hell.com/2020/05/04/create-a-bootable-windows-10-autopilot-device-with-powershell/
https://github.com/tabs-not-spaces/Intune.USB.Creator

requires full iso: https://tb.rg-adguard.net/public.php
in Powershell 5 admin:

````powershell
Install-Module MSAL.PS -Scope CurrentUser
Install-Module AzureAD -Scope CurrentUser
````

Install-Module MSAL.PS in Powershell 7 admin:

````powershell
Install-Module MSAL.PS -Scope CurrentUser
````

in Powershell 7

````powershell
Install-Module MSAL.PS -Scope CurrentUser -Force
Install-Module AzureAD -Scope CurrentUser -Force
Install-Module WindowsAutoPilotIntune -Scope CurrentUser -Force
Install-Module Microsoft.Graph.Intune -Scope CurrentUser -Force
Install-Module Intune.USB.Creator -Scope CurrentUser -Force
````

in Powershell 7

````powershell
sudo Publish-ImageToUSB -winPEPath "https://githublfs.blob.core.windows.net/storage/WinPE.zip" -windowsIsoPath "C:\Lab\Win10_21H2_German_x64.iso" -getAutopilotCfg
````

## Intune Sandbox

https://github.com/UniverseCitiz3n/Intune-App-Sandbox

## todos

- deploy winget via intune
    - https://www.microsoft.com/de-de/p/app-installer/9nblggh4nns1
- customize Lenovo vantage
    - https://github.com/aaronparker/intune/blob/main/Devices/Set-LenovoVantage.ps1
- login restriction to non local accounts
    - https://systemcenterdudes.com/intune-device-profile-user-login-restriction/

## HyperV test environment

via https://github.com/tabs-not-spaces/Intune.HV.Tools

requires full iso: https://tb.rg-adguard.net/public.php (download to `C:\Lab\Win10_21H2_German_x64.iso`)

init:

````powershell
Install-Module -Name Intune.HV.Tools -Scope CurrentUser
Install-Module -Name Hyper-ConvertImage
Install-Module -Name Microsoft.Graph.Intune
Install-Module -Name WindowsAutoPilotIntune
Initialize-HVTools -Path C:\Lab
Add-ImageToConfig -ImageName "2004" -IsoPath "C:\Lab\Win10_21H2_German_x64.iso"
Add-TenantToConfig -TenantName 'CompuGlobalHyperMegaNet' -ImageName 2004 -AdminUpn 'homer@CompuGlobalHyperMegaNet.com'
Add-NetworkToConfig -VSwitchName 'Default Switch'
````

create VMs without autopilot enabled:

````powershell
New-ClientVM -TenantName 'CompuGlobalHyperMegaNet' -OSBuild 2004 -NumberOfVMs 2 -CPUsPerVM 4 -VMMemory 4gb -SkipAutopilot
````
