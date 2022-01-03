#INFO: activar y desactivar la trasparencia

picom -b 2>> /dev/null
#Si activo picom ya esta activado ($? = 1), que apague el servicio
#Si loa activo y no estaba activo ($? = 0), que solo lo prenda
if [ $? == 1 ]; then
  killall -p picom
fi
