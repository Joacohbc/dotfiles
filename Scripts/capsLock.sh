xset q | grep "Caps Lock:   on" &>> /dev/null
if [ $? -eq 0 ]; then
    notify-send -i low "Caps Lock activado" -t 900
else   
    notify-send -i low "Caps Lock desactivado" -t 900
fi