#INFO: MUESTRA LA CANTIDAD ACTUALIZACIONES USANDO YAY (PACMAN y AUR) 


# Para ejecutar esto  yay -Sy sin que pida la contraseña poner 
# {USER_NAME} ALL= NOPASSWD: /usr/bin/yay -Sy en sudoers file
sudo yay -Sy &>> /dev/null 
NUM_UPDATE=$(yay -Qqu 2>> /dev/null | wc -l) # Cuenta las lineas, osea los paquetes para 
if [[ $NUM_UPDATE -eq 0 ]]; then 
    echo "None"
else 
    echo $NUM_UPDATE
fi
