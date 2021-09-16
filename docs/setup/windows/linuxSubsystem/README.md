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
sudo apt install -y neovim
sudo apt install -y bat tree ; sudo apt install -y -o Dpkg::Options::="--force-overwrite" bat ripgrep
mkdir -p ~/.local/bin
ln -s /usr/bin/batcat ~/.local/bin/bat


mkdir -p ~/.local/share/fonts cd ~/.local/share/fonts && wget https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20Nerd%20Font%20Complete.otf
````

`vim ~/.bashrc`
`````shell
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
fcd() {
    cd "$(find ~ -maxdepth 5 -not -path '*/\.git/*' -type d | fzf --height 40% --reverse)"
}
````

`vim ~/.vimrc`

````shell
" Source: https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation
" Install vim-plug if not found
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Initialize plugin system
call plug#end()

set encoding=utf8

" set font terminal font or set gui vim font
" to a Nerd Font (https://github.com/ryanoasis/nerd-fonts):
set guifont=DroidSansMono\ Nerd\ Font\ 12
command! -nargs=1 -bang Locate call fzf#run(fzf#wrap({'source': 'locate -ei $HOME'}, <bang>0))
````

