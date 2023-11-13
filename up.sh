#!/bin/bash

cd "$HOME"/Documents/workspace/dotfiles/provision
ansible-playbook -vv -K -i hosts playbook.yml "$@"
