#INFO: Limpieza de cache y paquetes inutiles 

#Buscar paquetes huerfanos y los elimina
sudo yay -Rsdn $(yay-Qqdt)

#Limpia el cache de pacman y yay
sudo pacman -Scc
sudo yay -Sc