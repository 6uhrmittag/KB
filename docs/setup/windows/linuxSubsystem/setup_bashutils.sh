#!/usr/bin/env bash

TMP_DIR=$(mktemp -d)

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



function downloadscript() {
  [[ -z ${1} ]] && { echo "URL must provided!" && exit 1; }
  [[ -z ${2} ]] && { echo "Targetpath must provided!" && exit 1; }

  FILENAME="$(echo $1 | rev | cut -d '/' -f1 | rev)"
  INSTALL_PATH="${2}${FILENAME}"
  TMP_INSTALL_PATH="${TMP_DIR}/${FILENAME}"
  MSG_INSTALL_ACTION="already the newest version"

  wget --quiet -O "$TMP_INSTALL_PATH" "$1"

  bash -n "$TMP_INSTALL_PATH" || { echo "Script $TMP_INSTALL_PATH broken! Stopping" && exit 1; }

  if [[ -f "$INSTALL_PATH" ]]; then
    if [[ $(diff --brief "$INSTALL_PATH" "$TMP_INSTALL_PATH") ]]; then
      sudo cp "$INSTALL_PATH"{,.previous}
      MSG_INSTALL_ACTION="updated"
    fi
  else
    sudo cp "$TMP_INSTALL_PATH" "$INSTALL_PATH"
    MSG_INSTALL_ACTION="installed"
  fi

  sudo chmod 770 "$INSTALL_PATH"
  sudo chgrp adm "$INSTALL_PATH"

  printf "%-.60s [%s]\n" "$(ls "$INSTALL_PATH")................................" "${MSG_INSTALL_ACTION}"
}

satisfy file-line "Custom Aliases" ~/.bashrc '[ -f $HOME/.bashrc_aliases ] && . $HOME/.bashrc_aliases'
cp ./utils/.bashrc_aliases ~/.bashrc_aliases

downloadscript https://raw.githubusercontent.com/HariSekhon/DevOps-Bash-tools/master/docker_registry_list_images.sh /usr/local/bin/
downloadscript https://raw.githubusercontent.com/HariSekhon/DevOps-Bash-tools/master/find_duplicate_files_by_checksum.sh /usr/local/bin/
downloadscript https://raw.githubusercontent.com/HariSekhon/DevOps-Bash-tools/master/golang_get_install.sh /usr/local/bin/
downloadscript https://raw.githubusercontent.com/HariSekhon/DevOps-Bash-tools/master/kubectl_images.sh /usr/local/bin/

# https://github.com/HariSekhon/Templates/blob/master/Dockerfile

#satisfy symlink "$HOME/dotfiles/bash/.bashrc" "$HOME/.bashrc"

rm -rf "TMP_DIR"

echo ""
echo "Script done!"
exit
