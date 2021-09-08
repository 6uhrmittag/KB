# SubSystem (Ubuntu)

Install Subsystem (ubuntu) and install+configure as shown below

## setup wsl2

- https://docs.microsoft.com/en-us/windows/wsl/install-win10
- https://docs.microsoft.com/en-us/windows/wsl/setup/environment

```powershell
wsl --install
wsl --set-default-version 2
```

### install Distro

```
wsl --list --online
wsl --install -d <Distribution Name>
```

## Setup Ubuntu
### Install Tools via Script

In Ubnutu, bootstrapping via Script:
````shell
cd /tmp \
    && wget https://raw.githubusercontent.com/6uhrmittag/KB/master/docs/setup/windows/linuxSubsystem/bootstrap.sh \
    && chmod +x bootstrap.sh \
    && ./bootstrap.sh
````

### ZSH (experimental)

sudo apt install zsh

#### fzf

````shell
#https://github.com/lincheney/fzf-tab-completion
sudo apt install fd-find

ln -s $(which fdfind) ~/.local/bin/fd

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
apt install neovim
apt install ripgrep bat tree ; sudo apt install -o Dpkg::Options::="--force-overwrite" bat ripgrep
mkdir -p ~/.local/bin
ln -s /usr/bin/batcat ~/.local/bin/bat


mkdir -p ~/.local/share/fonts cd ~/.local/share/fonts && curl -fLo "Droid Sans Mono for Powerline Nerd Font
Complete.otf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20Nerd%20Font%20Complete.otf
````