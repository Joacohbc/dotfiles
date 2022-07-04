#INFO: Determina si hay conexion de red o no

connected="說"
disconnected="ﲁ"

#Hace un ping
curl -I google.com &>/dev/null

#Si no hay respuesta ($? = 1), entoces esta offline
#Si hay respuesta ($? = 0), entoces esta online
if [ $? -eq 0 ]; then
    echo "$connected Online - $(ping -c 1 google.com | grep "avg" | cut -d "/" -f 6) ms" 
else
    echo "$disconnected Offline"
fi

