#INFO: Limpieza de cache y paquetes inutiles 

#Buscar paquetes huerfanos y los elimina
paquetesHuerfanos=$(yay -Qqdt) #Obtengo todos los paquetes huerfanos
if [ $? -eq 0 ]; then
    echo "> Se encotraron paquetes huerfanos <"
    yay -Rsdn $paquetesHuerfanos
else
    echo "> No se encotraron paquetes huerfanos <"
fi

#Limpia el cache de pacman y yay
echo "> Limpieza del cache de Pacman y Yay <"
sudo pacman -Scc
yay -Sc