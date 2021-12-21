#!/bin/sh
actual=`brightnessctl g`
max=`brightnessctl m`

result=`expr $actual \* 100`

porcentaje=`expr $result / $max`

echo $porcentaje"%"