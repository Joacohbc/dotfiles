#INFO: activar y desactivar la trasparencia

picom -bcG --config $HOME/.config/picom.conf 2>> /dev/null

#Si lo activo y no estaba activo ($? = 0), que solo lo prenda
#Si activo picom ya esta activado ($? = 1), que apague el servicio

if [ $? == 0 ]; then
	notify-send -i low "Picom activado" -t 900
else
    killall -p picom
    notify-send -i low "Picom desactivado" -t 900
fi
