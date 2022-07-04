#INFO: Cambiar lenguaje del teclado de US to ES por N milisegundos
setxkbmap -query | grep us 

MILISEGUNDOS=1900
#Si grep encuentra "us"($? = 0), entoces el teclado esta en ingles y lo pone en español
if [ $? -eq 0 ]; then 
    setxkbmap es
    notify-send -i low "Teclado ES activado por $MILISEGUNDOS milisegundos" -t $MILISEGUNDOS
    sleep $(expr $MILISEGUNDOS / 1000)
    setxkbmap us
    notify-send -i low "Teclado US activado nuevamente" -t 900
fi