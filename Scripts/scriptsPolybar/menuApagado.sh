#!/usr/bin/env bash

## Author  : Aditya Shakya
## Mail    : adi1090x@gmail.com
## Github  : @adi1090x
## Twitter : @adi1090x

## MODIFICADO POR MI

uptime=$(uptime -p | sed -e 's/up //g')

rofi_command="rofi" 

shutdown=" Shutdown"
reboot=" Restart"
lock=" Lock"
updateLock=" Update Lockscreen "
suspend=" Sleep"
logout=" Logout"

# Confirmation
confirm_exit() {
	rofi -dmenu\
		-i\
		-no-fixed-num-lines\
		-p "Are You Sure?"
}

# Message
msg() {
	rofi -e "Available Options  -  yes / y / no / n"
}

# Variable passed to rofi
options="$lock\n$updateLock\n$suspend\n$logout\n$reboot\n$shutdown"

chosen="$(echo -e "$options" | $rofi_command -p "Uptime $uptime" -I -dmenu -selected-row 0)"
case $chosen in
    $shutdown)
		ans=$(confirm_exit &)
		if [[ $ans == "yes" || $ans == "YES" || $ans == "y" || $ans == "Y" ]]; then
			systemctl poweroff
		elif [[ $ans == "no" || $ans == "NO" || $ans == "n" || $ans == "N" ]]; then
			exit 0
        else
			msg
        fi
        ;;
    $reboot)
		ans=$(confirm_exit &)
		if [[ $ans == "yes" || $ans == "YES" || $ans == "y" || $ans == "Y" ]]; then
			systemctl reboot
		elif [[ $ans == "no" || $ans == "NO" || $ans == "n" || $ans == "N" ]]; then
			exit 0
        else
			msg
        fi
        ;;
    $lock)
		betterlockscreen -l &
        ;;
	$updateLock)
		sh ~/Scripts/actualizarWall.sh
		;;
    $suspend)
		ans=$(confirm_exit &)
		if [[ $ans == "yes" || $ans == "YES" || $ans == "y" || $ans == "Y" ]]; then
			mpc -q pause
			amixer set Master mute
			systemctl suspend
		elif [[ $ans == "no" || $ans == "NO" || $ans == "n" || $ans == "N" ]]; then
			exit 0
        else
			msg
        fi
        ;;
    $logout)
		ans=$(confirm_exit &)
		if [[ $ans == "yes" || $ans == "YES" || $ans == "y" || $ans == "Y" ]]; then
			i3-msg exit
		elif [[ $ans == "no" || $ans == "NO" || $ans == "n" || $ans == "N" ]]; then
			exit 0
        else
			msg
        fi
        ;;
esac