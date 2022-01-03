#INFO: Activar los monitores

#Activo los 2 monitores
xrandr --output HDMI-1 --mode 1366x768 --rate 60 --right-of eDP-1 

#Recargo los Wallpapers
nitrogen --restore

#Notifico que termine
notify-send -i low "Monitores activos actualizados" -t 1500 

