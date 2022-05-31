#!/usr/bin/env bash

## Author  : Aditya Shakya
## Mail    : adi1090x@gmail.com
## Github  : @adi1090x
## Twitter : @adi1090x

## MODIFICADO POR MI

uptime=$(uptime -p | sed -e 's/up //g')

rofi_command="rofi" 

#Opciones de apagado
lock="1 -  Lock"
updateLockRandom="2 -  Update Lockscreen"
suspend="3 - 鈴 Sleep"
updatebg="4 -  Change Background"
updateLock="5 -  Simple Lockscreen"
shutdown="6 -  Shutdown"
logout="7 -  Logout"
reboot="8 - 拉 Restart"

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
options="$lock\n$updateLockRandom\n$suspend\n$updatebg\n$updateLock\n$shutdown\n$logout\n$reboot"

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
		betterlockscreen -l
        ;;
	$updateLockRandom)
		sh $HOME/Scripts/actualizarWall.sh
		;;
    $suspend)
		mpc -q pause
		amixer set Master mute
		betterlockscreen -l &
		systemctl suspend
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
	$updatebg)
		cat $HOME/.fehbg | grep m1.png
		if [ $? -eq 0 ]; then
			sh "$HOME/Scripts/feh-config.sh" 1 #Pongo el fondo de arch
		else
			sh "$HOME/Scripts/feh-config.sh" 0 #Pongo los otros fondos
		fi
		;;
	$updateLock)
		betterlockscreen -u $HOME/Wallpaper/background/archanime.png
		notify-send -i low "Locksreen simple actualizado" -t 1500 
		;;
esac
