#INFO: Activar/Desactivar los monitores

#Desactivo los monitores desconectados
for m in $(xrandr --query | grep "disconnected" | cut -d" " -f1); do
    xrandr --output $m --off
    notify-send -i low "Monitor $m desactivado" -t 2500
done

#Luego, si estan los 2 monitores activo los 2
NUM_MONITORS=$(xrandr --query | grep -w "connected" | wc -l)
if [ $NUM_MONITORS -eq 2 ]; then
    xrandr --output HDMI-1 --auto --right-of eDP-1
    notify-send -i low "Monitores activados" -t 1500 
else
    xrandr --output eDP-1 --auto
    notify-send -i low "Solo el monitor principal activado" -t 1500 
fi

#Recargo los Wallpaper
nitrogen --restore

#Notifico que termine
notify-send -i low "Monitores activos actualizados" -t 1500 

