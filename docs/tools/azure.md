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

https://www.getrubix.com/blog/intune-and-package-managers-part-2-winget

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

### testing

- generate hyperv VMs
    - https://github.com/tabs-not-spaces/Intune.HV.Tools

### deployment

- create usb stick for autopilot
    - https://github.com/tabs-not-spaces/Intune.USB.Creator

## todos

- deploy winget via intune
    - https://www.microsoft.com/de-de/p/app-installer/9nblggh4nns1
- customize Lenovo vantage
    - https://github.com/aaronparker/intune/blob/main/Devices/Set-LenovoVantage.ps1
- login restriction to non local accounts
    - https://systemcenterdudes.com/intune-device-profile-user-login-restriction/
