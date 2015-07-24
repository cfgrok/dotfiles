#!/usr/bin/env zsh

#includes
source $SANDBOXES/goshell/include.zsh
source $SANDBOXES/gcloudshell/include.zsh

function t() {
    echo "argv:" $argv
    for (( i=1; i<=$#argv; i++ ))
        do echo "i: $i , $argv[i]"
    done

    echo "part:" $argv[2,-1]
}

#Takes each argument and applies it to a docker run command
function _docker_run() {
    eval "docker run $argv"
}

#standard default docker zsh function
function _docker_zsh() {
    local shell=$1
    local src=$2

    _docker_run "--rm" \
        "-v ~/.oh-my-zsh:/root/.oh-my-zsh" \
        "-v ~/.dircolors:/root/.dircolors " \
        "-v ~/.zsh_history:/root/.zsh_history" \
        "-e TERM=$TERM " \
        "-v $SANDBOXES/$shell/zshrc:/root/.zshrc" \
        "-v `pwd`:$src" \
        ${argv:3} \
        "-it markmandel/$shell zsh"
}

#Credit: https://github.com/jbbarth/dotfiles/blob/master/.zsh/docker.zsh
function docker-cleanup() {
    echo "* Removing old containers"
    docker ps -qa | xargs --no-run-if-empty -n 1 docker rm
    echo "* Removing <none> images"
    docker images --filter dangling=true -q | xargs --no-run-if-empty -n 1 docker rmi
}