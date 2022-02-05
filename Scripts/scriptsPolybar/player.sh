#!/bin/sh
#SACADO DE: SACADO DE: https://github.com/AriosJentu/i3-polybar-config/

player_status=$(playerctl status 2> /dev/null)
player_titles=$(playerctl metadata title 2> /dev/null)

playerctl metadata title &> /dev/null #para que no tire el resultado al la salida

#Si no tiene titulo
if [ "$?" == "1" ]; then
	if [ "$player_status" = "Playing" ]; then
		echo " `playerctl status` "
	elif [ "$player_status" = "Paused" ]; then
		echo " `playerctl status`"
	elif [ "$player_status" = "Stopped" ]; then
		echo " `playerctl status`"
	else
		echo ""
	fi
else
#Si tiene titulo
	if [ "$player_status" = "Playing" ]; then
		echo " $player_titles"
	elif [ "$player_status" = "Paused" ]; then
		echo " $player_titles"
	elif [ "$player_status" = "Stopped" ]; then
		echo " $player_titles"
	else
		echo ""
	fi
fi

