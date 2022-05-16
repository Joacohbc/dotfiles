#!/usr/bin/env bash

# Add this script to your wm startup file.

DIR="$HOME/.config/polybar/hack"

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Listo los monitores y abro una sesion de polybar para cada
# monitor activo, desde el mismo archivo de conf
MONITOR_PRIMARIO="eDP-1"

if [ "$1" == "save-bat" ]; then
    MONITOR=$MONITOR_PRIMARIO polybar -q top -c "$DIR"/configSaveBat.ini &
    MONITOR=$MONITOR_PRIMARIO polybar -q bottom -c "$DIR"/configSaveBat.ini &  
    notify-send -i low "Polybar activado en $MONITOR_PRIMARIO (Modo Battery Save)" -t 2500
    exit 0
fi

for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    
    if [ "$m" == "$MONITOR_PRIMARIO" ]; then
        MONITOR=$m polybar -q top -c "$DIR"/config.ini &
        MONITOR=$m polybar -q bottom -c "$DIR"/config.ini &  
        notify-send -i low "Polybar activado en $m" -t 2500
    else
        MONITOR=$m polybar -q top -c "$DIR"/configSegundoMonitor.ini &
        MONITOR=$m polybar -q bottom -c "$DIR"/configSegundoMonitor.ini &  
        notify-send -i low "Polybar activado en $m" -t 2500
    fi
done





