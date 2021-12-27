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

[[ $(find /var/lib/apt/periodic/update-success-stamp -mmin +30) ]] || {
  sudo apt-get update && sudo apt-get dist-upgrade -y
}


##############  apt Packages  ######################
toolsToInstall=$(
  cat <<EOF
apt-transport-https
vim
unattended-upgrades
make
pkg-config
libssl-dev
net-tools
moreutils
build-essential
cmake
jq
ruby
ruby-dev
python3-pip
nghttp2
EOF
)
section "apt Packages"
for line in $toolsToInstall; do
  satisfy apt "${line}"
done
end-section

##############  go Packages  ######################
section "go Packages"
  satisfy golang "go1.16.6"
  satisfy file-line "Setup go" ~/.profile 'export PATH=$PATH:/usr/local/go/bin'
  satisfy file-line "Setup go" ~/.profile 'export PATH=$PATH:$(go env GOPATH)/bin'
  [[ "$(command -v go)" ]] || { echo "Restart Terminal to use go" && exit 1;}
  #go get github.com/rgeyer/boilr
  #go get github.com/hakluke/hakcheckurl
  #GO111MODULE=on go get -v github.com/projectdiscovery/httpx/cmd/httpx
  #GO111MODULE=on go get -v

  go env -w GO111MODULE=auto

  satisfy go-package "github.com/rgeyer/boilr"
  satisfy go-package "github.com/hakluke/hakcheckurl"
  satisfy go-package "github.com/projectdiscovery/httpx/cmd/httpx"
  satisfy go-package "github.com/projectdiscovery/nuclei/v2/cmd/nuclei"
  satisfy go-package "github.com/webdevops/go-replace"

end-section

##############  basher Packages ######################
section "basher Packages"
  function install-basher () {
    [[ "$(command -v basher)" ]] || curl -s https://raw.githubusercontent.com/basherpm/basher/master/install.sh | bash
    [[ "$(command -v basher)" ]] || { echo "Restart Terminal to use bashew" && exit 1;}
  }
  satisfy executable "basher"

  function install-bashew () {
    [[ "$(command -v bashew)" ]] || basher install pforret/bashew
  }
  satisfy executable "bashew"

  function install-setver () {
    [[ "$(command -v setver)" ]] || basher install pforret/setver
  }
  satisfy executable "setver"
end-section

##############  binaries  ######################
section "various Packages"
  function install-lychee () {
    wget -q -c https://github.com/lycheeverse/lychee/releases/download/0.7.0/lychee-0.7.0-x86_64-unknown-linux-gnu.tar.gz -O - | tar -xz /usr/local/bin/lychee && chmod +x /usr/local/bin/lychee
  }
  satisfy executable "lychee"

  function install-puppet-bolt () {
    [[ "$(dpkg-query -l puppet-bolt)" ]] || {
      notice "Installing Puppet Bolt" &&
        wget "https://apt.puppet.com/puppet-tools-release-$(lsb_release -sc).deb" -O /tmp/puppet.deb &&
        sudo dpkg -i /tmp/puppet.deb &&
        sudo apt-get update &&
        sudo apt-get -y install puppet-bolt &&
        sudo mkdir -p /etc/puppetlabs/bolt &&
        echo 'analytics: false' | sudo tee /etc/puppetlabs/bolt/bolt-defaults.yaml
    }
  }
  satisfy executable "puppet-bolt"
end-section

#####

# setup unattendet Upgrades
# Source https://gist.github.com/waja/d9e176f712ae6a6e4442486df80a13ba

cat > '/etc/apt/apt.conf.d/99unattended-upgrades' <<EOF
Unattended-Upgrade::Origins-Pattern {
        "site=*";
};
EOF

cat > '/etc/apt/apt.conf.d/10periodic' <<EOF
APT::Periodic::Update-Package-Lists "1";
APT::Periodic::Download-Upgradeable-Packages "1";
APT::Periodic::AutocleanInterval "7";
APT::Periodic::Unattended-Upgrade "1";
EOF

#####

# WSL
cat > '/etc/wsl.conf' <<EOF
[automount]
enabled=true
# unterbindet "world readable", führt bei einigen Tools(gem) zu Warnungen
options="metadata,umask=0033"
EOF

cat > '/mnt/c/Users/<Username>/.wslconfig' <<EOF
[wsl2]
memory=4GB # Limits VM memory in WSL 2 to 4 GB
EOF

# wsl --shutdown

###

function nodejs () {
  curl -fsSL https://deb.nodesource.com/setup_current.x | sudo -E bash -
  sudo apt-get install -y nodejs
}
satisfy executable "nodejs"
end-section

exit
