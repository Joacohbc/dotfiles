#Paquetes
alias inpc="sudo pacman -S"
alias unpc="sudo pacman -Rns"
alias uppc="sudo pacman -Syyu"

alias yup="yay -Syu"
alias yun="yay -Rns"
alias yin="yay -S"

#Generales
alias c="clear"
alias x="exit"
alias pgg="ping 8.8.8.8"

#ClipBoard(CB)
alias pwdc="pwd | xclip -sel c" #Directorio actul al CB
alias cbo="xclip -o -sel clip" #Mostrar CB
alias cbil="xclip -sel clip" #Meter en CB de manera larga
alias cbi="sh ~/Scripts/copiarAClipboard.sh" #Meter en CB manera corta
alias copyf="xclip-copyfile" #Copiar archivo a CB
alias pastef="xclip-pastefile" #Pegar archivo a CB
alias ipc="curl -s http:/ifconfig.me | xclip -sel clip" #Copiar IP Publica al CB

#Moverme entre directorios

