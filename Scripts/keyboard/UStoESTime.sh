#INFO: Cambiar lenguaje del teclado de US to ES por N Segundos
setxkbmap -query | grep us 

SEGUNDOS=3
#Si grep encuentra "us"($? = 0), entoces el teclado esta en ingles y lo pone en español
if [ $? -eq 0 ]; then 
    setxkbmap es
    notify-send -i low "Teclado ES activado por 3 segundos" -t "$SEGUNDOS"000
    sleep $SEGUNDOS
    setxkbmap us
    notify-send -i low "Teclado US activado nuevamente" -t 900
fi