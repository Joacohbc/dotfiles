#INFO: Averigua el brillo

#Guarda el balor del brillo actual y el maximo
actual=`brightnessctl g`
max=`brightnessctl m`

#Calcula porcentaje
echo `expr \( $actual \* 100 \) / $max`"%"
