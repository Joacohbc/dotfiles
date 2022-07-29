# INFO: Pone el fondo de pantalla

# xrandr --listmonitors -> Retorna los monitores ya conectados y configurados
if [ $(xrandr --listmonitors | grep Monitors | cut -d" " -f2) -eq 1 ]; then
    feh --bg-fil $HOME/Wallpaper/background/simple.png
    exit 0
fi


if [ "$1" == "1" ]; then
    feh --bg-fil $HOME/Wallpaper/background/simple.png
else
    feh --bg-fil $HOME/Wallpaper/background/m1.png $HOME/Wallpaper/background/m2.png
fi