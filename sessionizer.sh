#!/usr/bin/env bash

if [[ $# -eq 1 ]]; then
    selected=$1
else
    selected=$(find ~/ ~/code ~/code/rust /etc/nixos -mindepth 1 -maxdepth 1 -type d | fzf)
fi

if [[ -z $selected ]]; then
    exit 0
fi

selected_name=$(basename "$selected" | tr . _)
kitty_running=$(pgrep kitty)

kitty @ launch --type tab --title $selected_name --no-response $selected
exit 0
