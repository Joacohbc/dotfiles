#INFO: MUESTRA LA CANTIDAD ACTUALIZACIONES (PACMAN y AUR)

NUM_UPDATE=$(yay -Qu | wc -l)
if [[ $NUM_UPDATE -eq 0 ]]; then 
    echo "None"
else 
    echo $NUM_UPDATE
fi