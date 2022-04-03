#Paquetes
#alias inpc="sudo pacman -S"
#alias unpc="sudo pacman -Rns"
#alias uppc="sudo pacman -Syyu"
alias pc="sudo pacman"

#alias yup="yay -Syu"
#alias yun="yay -Rns"
#alias yin="yay -S"

#Generales
alias c="clear"
alias x="exit"
alias pgg="ping 8.8.8.8"
alias vld="vivaldi-stable"
alias fixtime="sudo ntpd -qg"

#ClipBoard(CB)
alias pwdc="pwd | xclip -sel c" #Directorio actul al CB
alias cbo="xclip -o -sel clip" #Mostrar CB
alias cbil="xclip -sel clip" #Meter en CB de manera larga
alias cbi="sh ~/Scripts/copiarAClipboard.sh" #Meter en CB manera corta
alias copyf="xclip-copyfile" #Copiar archivo a CB
alias pastef="xclip-pastefile" #Pegar archivo a CB
alias ipc="go-ip public | xclip -sel clip" #Copiar IP Publica al CB

#Trash
alias tput="trash-put"
alias tlist="trash-list"
alias trm="trash-rm"
alias trestore="trash-restore"
alias rm="trash-put"

#Tar
alias tarh="echo Help: \"tar -cf/-xf <name/path .tar> <files/path to tar>\""
alias tarc="tar -cf"
alias tarx="tar -xf"


#Ir a la carpeta con "goto" y abrir VSCode ahi
goc() {
    goto $@;code ./;exit
}

#Comando goto
source "/home/joaco/Archivos/Colegio y Estudio/Z-Proyectos/Go/goto/MyAlias.sh"

source "/home/joaco/Scripts/varsSsh.sh"

scp2server() {
    scp -P $PORT_MY_SSH $@ $IP_MY_SSH:/home/joaco/Temp
}
