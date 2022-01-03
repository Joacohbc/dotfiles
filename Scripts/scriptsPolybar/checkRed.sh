#INFO: Determina si hay conexion de red o no

connected="說"
disconnected="ﲁ"

#Hace un ping
ping -c 1 google.com &>/dev/null

#Si no hay respuesta ($? = 1), entoces esta offline
#Si hay respuesta ($? = 0), entoces esta online
if [ $? == 0 ]; then
    echo "$connected Online" 
else
    echo "$disconnected Offline"
fi

