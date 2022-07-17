#!/bin/bash

cd "$HOME"/Documents/workspace/dotfiles/provision
ansible-playbook -vvv -K -i hosts primary.yml
