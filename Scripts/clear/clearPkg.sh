#INFO: Limpieza de cache y paquetes inutiles 

#Buscar paquetes huerfanos y los elimina
sudo pacman -Rsdn $(pacman -Qqdt)

#Limpia el cache de pacman
sudo pacman -Scc

#Buscar paquetes huerfanos y los elimina
sudo yay -Rsdn $(yay-Qqdt)

#Limpia el cache de yay
sudo yay -Sc