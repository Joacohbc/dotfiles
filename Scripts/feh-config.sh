# INFO: Pone el fondo de pantalla
if [ $(xrandr --listmonitors | grep Monitors | cut -d" " -f2) -eq 1 ]; then
    feh --bg-fil $HOME/Wallpaper/background/archanime.png
    exit $?
fi

if [ "$1" == "1" ]; then
    feh --bg-fil $HOME/Wallpaper/background/archanime.png
else
    feh --bg-fil $HOME/Wallpaper/background/m1.png $HOME/Wallpaper/background/m2.png
fi