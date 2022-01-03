#INFO: Notificar cuando Caps Locks esta activo

xset q | grep "Caps Lock:   on" &>> /dev/null

#Si grep encuentra "Caps Lock:   on"($? = 0), entoces el CapsLock esta activo y lo desactiva

#Si grep no encuentra ""Caps Lock:   on" ($? = 1), entoces el CapsLock esta 
#desactivo y lo activa

if [ $? -eq 0 ]; then
    notify-send -i low "Caps Lock activado" -t 900
else   
    notify-send -i low "Caps Lock desactivado" -t 900
fi