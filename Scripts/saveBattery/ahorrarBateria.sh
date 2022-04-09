#Importo colores
source ./colorPrints.sh

#Mensaje de confirmacion
msg () {
    echo ""
    preguntar "¿$1? (y/any):"
    read op

    if [ "$op" == "y" ]; then
        return 0
    else
        return 1
    fi
}

#Activo ahorrador de energia
msg "Activar tlp y powertop"
if [ $? == 0 ]; then
    sudo tlp start
    sudo powertop --auto-tune
fi 

#Apago la red cable
msg "Desactivar red por cable"
if [ $? == 0 ]; then
    sudo ifconfig enp2s0 down 

    if [ $? == 0 ]; then
        exito "Se desactivo la red por cable"
    fi
fi

#Apago WIFI
msg "Desactivar red inalambrica"
if [ $? == 0 ]; then
    sudo ifconfig wlp3s0 down 
    sudo rfkill block wifi

    if [ $? == 0 ]; then
        exito "Se desactivo la red inalambrica"
    fi
fi

#Apago servicio de red
msg "Apagar servicio de red"
if [ $? == 0 ]; then
    systemctl stop NetworkManager

    if [ $? == 0 ]; then
        exito "Se desactivo el servicio de red"
    fi
fi

#Apago Bluetooh
msg "Apagar bluetooth"
if [ $? == 0 ]; then
    sudo bluetooth off
    sudo rfkill block bluetooth

    if [ $? == 0 ]; then
        exito "Se desactivo el bluetooth"
    fi
fi

#Solo un monitorc
mon1="eDP-1" #Monitor 1
mon2="HDMI-1" #Monitor 2

msg "Solo usar un monitor"
if [ $? == 0 ]; then

    xrandr --output $mon2 --off

    if [ $? == 0 ]; then
        exito "Se desactivo el monitor de HDMI"
    else
        exit 1
    fi 
    
    xrandr --output $mon1 --auto
    if [ $? == 0 ]; then
        exito "Se activa solo un monitor"
    else
        exit 1
    fi 

    #Reiniciar Polybar
    $HOME/.config/polybar/hack/launch.sh &>> /dev/null
    if [ $? == 0 ]; then
        exito "Se recargo el Polybar"
    else
        exit 1
    fi

    #Reiniciar Fondo de pantalla
    nitrogen --restore &>> /dev/null
fi

#Bajo el brillo
brightnessctl set 15% &>> /dev/null
if [ $? == 0 ]; then
    exito "Se bajo el brillo"
fi
