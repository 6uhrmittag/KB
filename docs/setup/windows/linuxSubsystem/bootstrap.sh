#!/usr/bin/env bash

# Don't invoke directly!
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
  echo "Don't invoke script directly!"
  echo "Usage: ./main.sh  -f bootstrap.sh"
  echo "Debug: ./main.sh  -f bootstrap.sh -d"
  exit 1
fi

updateOS() {
  if [[ $(find /var/lib/apt/periodic/update-success-stamp -mmin +30) ]]; then
    notice "Updating OS"
    sudo apt-get update && sudo apt-get dist-upgrade -y
  else
    notice "Skipping apt-get update - update-success-stamp <30min old"
  fi
}

installTools() {
  notice "Installing Tools"
  IFS=$'\n'
  for line in $@; do
    [[ "${line}" == "\#*" ]] && [[ $(dpkg-query -l "${line}") ]] || {
      notice "Installing: ${line}" &&
        sudo apt-get install "${line}" -y
    }
  done
  unset IFS
  unset line

  [[ -f /usr/local/go/bin/go ]] || {
    echo "Installing Golang" &&
      wget -c https://golang.org/dl/go1.16.6.linux-amd64.tar.gz -O - | sudo tar -xz -C /usr/local &&
      echo 'export PATH=$PATH:/usr/local/go/bin' | tee -a ~/.profile &&
      echo 'export PATH=$PATH:$(go env GOPATH)/bin' | tee -a ~/.profile &&
      . ~/.profile
  }

  [[ -f /usr/local/bin/go-replace ]] ||
    sudo wget -O /usr/local/bin/go-replace https://github.com/webdevops/go-replace/releases/download/1.1.2/gr-64-linux &&
    sudo chmod +x /usr/local/bin/go-replace &&
    unset local goReplace

  [ "$(command -v boilr)" ] || go get github.com/rgeyer/boilr
}

installPuppetBolt() {

  [ "$(dpkg-query -l puppet-bolt)" ] || {
    notice "Installing Puppet Bolt" &&
      wget "https://apt.puppet.com/puppet-tools-release-$(lsb_release -sc).deb" -O /tmp/puppet.deb &&
      sudo dpkg -i /tmp/puppet.deb &&
      sudo apt-get update &&
      sudo apt-get -y install puppet-bolt &&
      echo 'analytics: false' | sudo tee/etc/puppetlabs/bolt/bolt-defaults.yaml
  }
}

configTools() {
  notice "Config APT + unattended-upgrades"

  local config_apt=$(
    cat <<"EOF"
  APT::Periodic::Download-Upgradeable-Packages "1";
  APT::Periodic::AutocleanInterval "1";
  APT::Periodic::Update-Package-Lists "1";
  APT::Periodic::Unattended-Upgrade "1";
  Unattended-Upgrade::Remove-Unused-Dependencies "true";
  Unattended-Upgrade::Allowed-Origins {
          "${distro_id}:${distro_codename}";
          "${distro_id}:${distro_codename}-security";
          "${distro_id}ESMApps:${distro_codename}-apps-security";
          "${distro_id}ESM:${distro_codename}-infra-security";
          "${distro_id}:${distro_codename}-updates";
  };
EOF
  )

  echo "${config_apt}" | sudo tee /etc/apt/apt.conf.d/99custom_config >/dev/null
}

########################
# Returning Functions to main.sh
# add every function with "export -f <functionname>"
########################

if [ "${BASH_SOURCE[0]}" != "${0}" ]; then
  export -f updateOS
  export -f installTools
  export -f installPuppetBolt
  export -f configTools
fi
