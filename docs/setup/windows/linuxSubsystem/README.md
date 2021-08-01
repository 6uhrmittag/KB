# SubSystem (Ubuntu)

Install Subsystem (ubuntu) and install+configure as shown below

## setup wsl2

- https://docs.microsoft.com/en-us/windows/wsl/install-win10
- https://docs.microsoft.com/en-us/windows/wsl/setup/environment

```powershell
wsl --install
```

### install Distro

```
wsl --list --online
wsl --install -d <Distribution Name>
```

## system

Bootstrapping via Script

````shell
cd /tmp \
    && wget https://raw.githubusercontent.com/6uhrmittag/KB/master/docs/setup/windows/linuxSubsystem/mains.sh \
    && wget https://raw.githubusercontent.com/6uhrmittag/KB/master/docs/setup/windows/linuxSubsystem/bootstrap.sh \
    && chmod +x main.sh bootstrap.sh \
    && ./main.sh  -f bootstrap.sh -f bootstrap.sh
````