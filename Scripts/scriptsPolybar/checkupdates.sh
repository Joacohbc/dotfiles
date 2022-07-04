#INFO: MUESTRA LA CANTIDAD ACTUALIZACIONES USANDO YAY (PACMAN y AUR) 

NUM_UPDATE_NORMAL=$(checkupdates 2>> /dev/null)
if [ $? -ne 0 ]; then
    NUM_UPDATE_NORMAL=0
fi

# Checkeo 
NUM_UPDATE_AUR=$(pacman -Qm 2>> /dev/null | aur vercmp | wc -l)
if [ $? -ne 0 ]; then
    NUM_UPDATE_AUR=0
fi

NUM_UPDATE=$(expr $NUM_UPDATE_AUR + $NUM_UPDATE_NORMAL)
if [[ $NUM_UPDATE -eq 0 ]]; then 
    echo "None"
else 
    echo $NUM_UPDATE
fi
