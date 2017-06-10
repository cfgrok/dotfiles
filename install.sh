#!/bin/sh

sudo apt-get install software-properties-common
sudo apt-add-repository ppa:ansible/ansible
sudo apt-get update
sudo apt-get install ansible git

cd ~

if [ ! -d "~/Documents/workspace/dotfiles" ]; then
    mkdir Documents/workspace
    cd Documents/workspace
    git clone git@github.com:cfgrok/dotfiles.git
    echo 'primary' > ~/Documents/workspace/dotfiles/.playbook
fi
