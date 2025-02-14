#!/bin/bash

# Power Options
declare -a options=("lock" "logout" "reboot" "shutdown")

choice=$(echo "${options[@]}" | dmenu -l -i -p 'System:')

case $choice in
    lock)
        i3lock -c '#000000'
        ;;
    logout)
        i3-msg exit
        ;;
    reboot)
        reboot
        ;;
    shutdown)
        shutdown now
        ;;
    *)
        exit 1
        ;;
esac