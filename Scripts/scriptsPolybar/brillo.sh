#INFO: Averigua el brillo

#Guarda el balor del brillo actual y el maximo
actual=`brightnessctl g`
max=`brightnessctl m`

#Calcula porcentaje
result=`expr $actual \* 100`
porcentaje=`expr $result / $max`

#Y lo muestra
echo $porcentaje"%"