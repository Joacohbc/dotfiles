#INFO: Activar/Desactivar los monitores

#Activo los 2 monitores
xrandr --output HDMI-1 --mode 1366x768 --rate 60 --right-of eDP-1

#Desactivo lso monitores desconectados
for m in $(xrandr --query | grep "disconnected" | cut -d" " -f1); do
    xrandr --output $m --off
    notify-send -i low "Monitor $m desactivado" -t 2500
done

#Recargo los Wallpaper
nitrogen --restore

#Notifico que termine
notify-send -i low "Monitores activos actualizados" -t 1500 

