#INFO: Activa la red wifi

#Desbloquea el wifi
sudo rfkill unblock wifi

#Da de alta la placa de wifi
sudo ifconfig wlp3s0 up

#Activa el servicio de red
sudo systemctl restart NetworkManager