#!/bin/sh

if [ ! -f /etc/apt/sources.list.d/ansible-ansible-*.list ]; then
    sudo apt-add-repository -y ppa:ansible/ansible
fi

sudo apt update
sudo apt install -y ansible git

module_path="$HOME"/.ansible/plugins/modules

if [ ! -f "$module_path"/gsetting ]; then
    mkdir -p "$module_path"
    wget -O "$module_path"/gsetting https://raw.githubusercontent.com/jistr/ansible-gsetting/master/gsetting.py
fi

if [ ! -d "$HOME"/Documents/workspace/dotfiles ]; then
    cd "$HOME"
    mkdir -p Documents/workspace
    cd Documents/workspace
    git clone https://github.com/cfgrok/dotfiles
fi
