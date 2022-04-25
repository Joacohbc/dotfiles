#!/usr/bin/env bash
rofi_command="rofi" 


# Settea el modo
MODE="$1"

function i3msg() {
    if [ "$MODE" == "goto" ];then
        i3-msg workspace $1
    else 
        i3-msg move container to workspace $1
    fi
}

wk1="1 - Code  "
wk2="2 - Browser "
wk3="3 - Multimedia "
wk4="Q - Files  "
wk5="W - First Monitor  "
wk6="E - Second Monitor  "
wk7="A - Discord ﭮ "
wk8="S - Random ﯂ "
wk9="D - Droidcam  "

# Variable passed to rofi
options="$wk1\n$wk2\n$wk3\n$wk4\n$wk5\n$wk6\n$wk7\n$wk8\n$wk9\n"

text="Select Workspace"
if [ "$MODE" == "switch" ]; then
    text="Move to Workspace"
fi

chosen="$(echo -e "$options" | $rofi_command -p "$text" -I -dmenu -matching prefix -font "FiraCode Nerd Font 11")"

case $chosen in
    $wk1)
        i3msg 1
        ;;
    $wk2)
        i3msg 2
        ;;
    $wk3)
        i3msg 3
        ;;
    $wk4)
        i3msg 4
        ;;
    $wk5)
        i3msg 5
        ;;
    $wk6)
        i3msg 6
        ;;
    $wk7)
        i3msg 7
        ;;
    $wk8)
        i3msg 8
        ;;
    $wk9)
        i3msg 9
        ;;
esac
