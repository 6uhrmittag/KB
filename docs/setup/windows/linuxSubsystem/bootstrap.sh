#!/usr/bin/env bash

function bootstrap-box() {
  local BOX_PATH="/usr/local/share/box/box.sh"
  if [ ! -f "$BOX_PATH" ]; then
    sudo mkdir -p $(dirname "$BOX_PATH")
    sudo wget -O "$BOX_PATH" https://raw.githubusercontent.com/AndrewVos/box/master/box.sh
    sudo chmod +x "$BOX_PATH"
  fi
  source "$BOX_PATH"
}
bootstrap-box
source /usr/local/share/box/box.sh

##############  customize here  ######################
toolsToInstall=$(
  cat <<EOF
apt-transport-https
vim
unattended-upgrades
make
EOF
)

for line in $toolsToInstall; do
  satisfy apt "${line}"
done

satisfy golang "go1.16.6"
satisfy file-line "Setup go" ~/.profile 'export PATH=$PATH:/usr/local/go/bin'
satisfy file-line "Setup go" ~/.profile 'export PATH=$PATH:$(go env GOPATH)/bin'

[[ "$(command -v go)" ]] || echo "Restart Terminal to use go" && exit 1
[[ "$(command -v boilr)" ]] || go get github.com/rgeyer/boilr
[[ "$(command -v basher)" ]] || curl -s https://raw.githubusercontent.com/basherpm/basher/master/install.sh | bash
[[ "$(command -v basher)" ]] || echo "Restart Terminal to use bashew" && exit 1
[[ "$(command -v bashew)" ]] || basher install pforret/bashew
[[ "$(command -v setver)" ]] || basher install pforret/setver

[[ "$(dpkg-query -l puppet-bolt)" ]] || {
  notice "Installing Puppet Bolt" &&
    wget "https://apt.puppet.com/puppet-tools-release-$(lsb_release -sc).deb" -O /tmp/puppet.deb &&
    sudo dpkg -i /tmp/puppet.deb &&
    sudo apt-get update &&
    sudo apt-get -y install puppet-bolt &&
    echo 'analytics: false' | sudo tee/etc/puppetlabs/bolt/bolt-defaults.yaml
}

[[ $(find /var/lib/apt/periodic/update-success-stamp -mmin +30) ]] || {
  sudo apt-get update && sudo apt-get dist-upgrade -y
}

echo "Script done!"
exit