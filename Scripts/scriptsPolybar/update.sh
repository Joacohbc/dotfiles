#INFO: MUESTRA LA CANTIDAD ACTUALIZACIONES USANDO YAY (PACMAN y AUR) 

NUM_UPDATE=$(yay -Qqu 2>> /dev/null | wc -l)
if [[ $NUM_UPDATE -eq 0 ]]; then 
    echo "None"
else 
    echo $NUM_UPDATE
fi
