#!/bin/bash

cd "$HOME"/Documents/workspace/dotfiles/playbooks
ansible-playbook -vv -K main.yml $([[ "$@" =~ "-t debug" ]] || printf %s "--skip-tags debug") "$@"
