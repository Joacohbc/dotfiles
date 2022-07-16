#INFO: Actualizar paquetes AUR y Normales
msg () {
    echo ""
    echo  "> ¿$1? (y/any):"
    read op

    if [ "$op" == "y" ]; then
        return 0
    else
        return 1
    fi
}

# Veo si actualizaciones
NUM_UPDATE_NORMAL=$(checkupdates 2>> /dev/null | wc -l)
if [ $? -ne 0 ]; then
    NUM_UPDATE_NORMAL=0
fi

# Veo si actualizaciones en AUR
NUM_UPDATE_AUR=$(pacman -Qm 2>> /dev/null | aur vercmp 2>> /dev/null | wc -l)
if [ $? -ne 0 ]; then
    NUM_UPDATE_AUR=0
fi

# Si no hay ninguna actualizacion salgo
TOTAL=$(expr $NUM_UPDATE_NORMAL + $NUM_UPDATE_AUR)
if [ $TOTAL -eq 0 ]; then
    echo -e "> Nada que actualizar (ENTER para salir)...<"
    read
    exit
fi

# Si hay actualizaciones muestro:
if [ $NUM_UPDATE_NORMAL -ne 0 ]; then

    echo -e "\n> Paquetes para actualizar: $NUM_UPDATE_NORMAL <"
    
    # Pregunto si quiere actualizar
    msg "Actualizar paquetes con Pacman"
    if [ $? -eq 0 ]; then
        sudo pacman -Syu
    fi
fi

if [ $NUM_UPDATE_AUR -ne 0 ]; then
    echo -e "\n> Paquetes para actualizar AUR: $NUM_UPDATE_AUR <"

    # Pregunto si quiere actualizar
    msg "Actualizar paquetes Yay (AUR)"
    if [ $? -eq 0 ]; then
        yay -Syu --aur # Actualizar solo AUR
    fi
fi

# Reinicio el Modulo que muestra las acutalizaciones de polybar
# polybar-msg action update restart &>> /dev/null

echo -e "\n> Actualizacion finalizada (ENTER para salir)...<"
read 
