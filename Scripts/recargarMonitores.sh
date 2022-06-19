#INFO: Activar/Desactivar los monitores

#Desactivo los monitores desconectados
for m in $(xrandr --query | grep "disconnected" | cut -d" " -f1); do
    xrandr --output $m --off
    notify-send -i low "Monitor $m desconectado" -t 2500
done

#Luego, si estan los 2 monitores activo los 2
NUM_MONITORS=$(xrandr --query | grep -w "connected" | wc -l) 
if [ $NUM_MONITORS -eq 2 ]; then
    # Digo que la salida (--ouput) eDP-1 
    # -> Sea primario --primary
    # -> Que lo configure automaticamente --auto
    xrandr --output eDP-1 --primary --auto

    # Digo que la salida HDMI-1 (--output)
    # -> Ese monitor este a la derecha de eDP-1 --right-of eDP-1
    # -> Que no sea primario --noprimary
    # -> Que lo configure automaticamente --auto
    xrandr --output HDMI-1 --right-of eDP-1 --noprimary --auto

    notify-send -i low "Monitores activados" -t 1500 
else
    xrandr --output eDP-1 --auto
    notify-send -i low "Solo el monitor principal activado" -t 1500 
fi


#Notifico que termine
notify-send -i low "Monitores activos actualizados" -t 1500 

