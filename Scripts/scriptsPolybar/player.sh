#!/bin/sh
#SACADO DE: SACADO DE: https://github.com/AriosJentu/i3-polybar-config/

player_status=$(playerctl status 2> /dev/null)
player_titles=$(playerctl metadata title 2> /dev/null)

playerctl metadata title &> /dev/null #para que no tire el resultado al la salida

#Si no tiene artista
if [ "$?" == "1" ]; then
	if [ "$player_status" = "Playing" ]; then
		echo "%{F#FFF} `playerctl status` "
	elif [ "$player_status" = "Paused" ]; then
		echo "%{F#FFF} `playerctl status`"
	elif [ "$player_status" = "Stopped" ]; then
		echo "%{F#FFF} `playerctl status`"
	else
		echo ""
	fi
else
#Si tiene artista
	if [ "$player_status" = "Playing" ]; then
		echo "%{F#FFF} $player_titles" #$player_artist - NO MOSTRAR ARTISTA
	elif [ "$player_status" = "Paused" ]; then
		echo "%{F#FFF} $player_titles" #$player_artist - NO MOSTRAR ARTISTA
	elif [ "$player_status" = "Stopped" ]; then
		echo "%{F#FFF} $player_titles" #$player_artist - NO MOSTRAR ARTISTA
	else
		echo ""
	fi
fi

