#!/bin/sh

if ! grep -qs 'deb http' /etc/apt/sources.list.d/ansible-ubuntu-ansible-*.list; then
    sudo apt-add-repository -y ppa:ansible/ansible
fi

sudo apt update
sudo apt install -y ansible git

if [ ! -d "$HOME"/Documents/workspace/dotfiles ]; then
    cd "$HOME"
    mkdir -p Documents/workspace
    cd Documents/workspace
    git clone https://github.com/cfgrok/dotfiles
fi
