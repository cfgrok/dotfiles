#!/bin/sh

if ! grep -qs 'deb http' /etc/apt/sources.list.d/ansible-ubuntu-ansible-xenial.list; then
    sudo apt-add-repository -y ppa:ansible/ansible
fi

sudo apt-get update
sudo apt-get install -y ansible git

cd ~

if [ ! -d ~/Documents/workspace/dotfiles ]; then
    mkdir -p Documents/workspace
    cd Documents/workspace
    git clone git@github.com:cfgrok/dotfiles.git
    echo 'primary' > ~/Documents/workspace/dotfiles/.playbook
fi
