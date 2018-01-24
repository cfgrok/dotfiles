#!/bin/sh

if ! grep -qs 'deb http' /etc/apt/sources.list.d/ansible-ubuntu-ansible-*.list; then
    sudo apt-add-repository -y ppa:ansible/ansible
fi

sudo apt-get update
sudo apt-get install -y ansible git

cd ~

if [ ! -d ~/Documents/workspace/dotfiles ]; then
    mkdir -p Documents/workspace
    cd Documents/workspace
    git clone https://github.com/cfgrok/dotfiles
    echo 'primary' > ~/Documents/workspace/dotfiles/.playbook

	#self update
	echo "Updating Dotfiles..."
	cd dotfiles
	git pull --rebase
	git checkout personal
fi
