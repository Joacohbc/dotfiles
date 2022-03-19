#INFO: Cambiar lenguaje del teclado de US to ES y viceversa

setxkbmap -query | grep us 

#Si grep encuentra "us"($? = 0), entoces el teclado esta en ingles y lo pone en español
#Si grep no encuentra "us" ($? = 1), entoces el teclado en español y lo pone en es ingles
if [ $? -eq 0 ]; then 
    setxkbmap es
    notify-send -i low "Teclado ES activado" -t 900
else
    setxkbmap us
    notify-send -i low "Teclado US activado" -t 900
fi

