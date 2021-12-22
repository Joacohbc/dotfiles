setxkbmap -query | grep us 
if [ $? -eq 0 ]; then 
    setxkbmap es
    notify-send -i low "Teclado ES activado" -t 900
else
    setxkbmap us
    notify-send -i low "Teclado US activado" -t 900
fi
