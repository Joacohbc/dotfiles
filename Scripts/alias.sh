#Paquetes
#alias inpc="sudo pacman -S"
#alias unpc="sudo pacman -Rns"
#alias uppc="sudo pacman -Syyu"
alias pc="sudo pacman"

#Generales
alias c="clear"
alias x="exit"
alias pgg="ping 8.8.8.8"
alias vld="vivaldi-stable"
alias fixtime="sudo ntpd -qg"

#ClipBoard(CB)

#Lo que se le pase como parametros los manda al clipboard
cbi(){
    echo "$@" | xclip -sel c 
}
alias cbil="xclip -sel c" #Meter en CB de manera larga con un "|"
alias cbo="xclip -o -sel clip" #Mostrar ultima CB

alias pwdc="pwd | xclip -sel c" #Directorio actul al CB
alias cmc="fc -ln -1 | xclip -sel c" #Copiar ultimo comando al CB
alias copyf="xclip-copyfile" #Copiar archivo a CB#
alias pastef="xclip-pastefile" #Pegar archivo a CB
alias ipc="go-ip public | xclip -sel clip" #Copiar IP Publica al CB

#Trash
alias tlist="trash-list"
alias trm="trash-rm"
alias trestore="trash-restore"
alias rm="trash-put"

#Tar
alias tarh="echo Help: \"tar -cf/-xf <name/path .tar> <files/path to tar>\"" #Mostrar info como hacer un tar
alias tarc="tar -cf" #Crear tar
alias tarx="tar -xf" #Deshacer tar

#Ir a la carpeta con "goto" y abrir VSCode ahi
goc() {
    goto $@
    if [[ "$?" == "0" ]]; then
        code ./
        exit 0
    else 
        echo "$OUTPUT"
    fi
}

#Comando goto
source "/home/joaco/Archivos/Colegio y Estudio/Z-Proyectos/Go/goto/MyAlias.sh"

source "/home/joaco/Scripts/varsSsh.sh"

scp2server() {
    scp -P $PORT_MY_SSH $@ $IP_MY_SSH:/home/joaco/Temp
}
