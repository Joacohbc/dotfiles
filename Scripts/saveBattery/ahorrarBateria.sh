#Importo colores
source ./colorPrints.sh

#Mensaje de confirmacion
msg () {
    echo ""
    preguntar "> ¿$1? (y/any):"
    read op

    if [ "$op" == "y" ]; then
        return 0
    else
        return 1
    fi
}

#Activo ahorrador de energia
msg "Activar tlp y powertop"
if [ $? -eq 0 ]; then
    sudo tlp start
    sudo powertop --auto-tune
fi 

#Apago la red cable
msg "Desactivar red por cable"
if [ $? -eq 0 ]; then
    sudo ifconfig enp2s0 down 

    if [ $? -eq 0 ]; then
        exito "> Se desactivo la red por cable exitosamente <"
    else
        error "> No se pudo desactivo la red por cable exitosamente <"
    fi
fi

#Apago WIFI
msg "Desactivar red inalambrica"
if [ $? -eq 0 ]; then
    sudo ifconfig wlp3s0 down 
    sudo rfkill block wifi

    if [ $? -eq 0 ]; then
        exito "> Se desactivo la red inalambrica exitosamente <"
    else
        error "> No se pudo desactivo la red inalambrica exitosamente <"
    fi
fi

#Apago servicio de red
msg "Apagar servicio de red"
if [ $? -eq 0 ]; then
    systemctl stop NetworkManager

    if [ $? -eq 0 ]; then
        exito " > Se detuvo el servicio de red exitosamente <"
    else
        error "> No se pudo detener el servicio de red  exitosamente <"
    fi
fi

#Apago Bluetooh
msg "Apagar bluetooth"
if [ $? -eq 0 ]; then
    sudo bluetooth off
    sudo rfkill block bluetooth

    if [ $? -eq 0 ]; then
        exito "> Se desactivo el bluetooth exitosamente <"
    else
        error "> No se pudo desactivar el bluetooth exitosamenta <"
    fi
fi

#Solo un monitor
mon1="eDP-1" #Monitor 1
mon2="HDMI-1" #Monitor 2

msg "Usar solo usar un monitor"
if [ $? -eq 0 ]; then

    xrandr --output $mon2 --off

    if [ $? -eq 0 ]; then
        exito "> Se desactivo el monitor de HDMI exitosamente <"
    else
        error "> No se pudo desactivar el segundo monitor <"
        exit 1
    fi 
    
    #Reiniciar Fondo de pantalla
    nitrogen --restore &>> /dev/null
fi

msg "Activar Polybar Save-Baterry"
if [ $? -eq 0 ]; then
    #Reiniciar Polybar 
    $HOME/Scripts/scriptsPolybar/launch.sh save-bat &>> /dev/null
    if [ $? -eq 0 ]; then
        exito "> Se activo Polybar en modo save-bat <"
    fi
fi

msg "Bajar brillo a 15%"
if [ $? -eq 0 ]; then
    #Bajo el brillo
    brightnessctl set 15% &>> /dev/null
    if [ $? -eq 0 ]; then
        exito "> Se bajo el brillo <"
    fi
fi

msg "Opciones Redshift"
if [ $? -eq 0 ]; then

    msg "Activar Redshift"
    if [ $? -eq 0 ]; then
        redshift -O 2500
        if [ $? -eq 0 ]; then
            exito "> Se activo el filtro de luz <"
        fi
    fi

    msg "Desctivar Redshift"
    if [ $? -eq 0 ]; then
        xrandr --output eDP-1 --gamma 1:1:1 --brightness 1.0
        if [ $? -eq 0 ]; then
            exito "> Se desactivo el filtro de luz <"
        fi
    fi

fi

msg "Desactivar trasparencia"
if [ $? -eq 0 ]; then
    #Apagar picom 
    killall -p picom &>> /dev/null
    if [ $? -eq 0 ]; then
        exito "> Se detuvo picom <"
    fi
fi