#!/bin/bash

alias svim='sudo -E nvim'
alias cfix='sudo udevadm trigger --subsystem-match=input --action=change'
alias sxiv='swayimg'
alias pdf='ol zathura'

# Credits: https://www.pgrs.net/2022/06/02/simple-command-line-function-to-decode-jwts/
jwt-decode() {
    jq -R 'split(".") |.[0:2] | map(gsub("-"; "+") | gsub("_"; "/") | gsub("%3D"; "=") | @base64d) | map(fromjson)' <<< "$1";
}
