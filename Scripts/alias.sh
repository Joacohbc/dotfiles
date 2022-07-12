############
# Paquetes #
############
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
alias src="source ~/.zshrc"

#################
# ClipBoard(CB) #
#################

#Lo que se le pase como parametros los manda al clipboard
cbi(){
    echo "$@" | xclip -sel c 
}
alias cbil="xclip -sel c" #Meter en CB de manera larga con un "|"
alias cbo="xclip -o -sel clip" #Mostrar ultima CB

alias pwdc="pwd | xclip -sel c" #Directorio actul al CB
alias cbc="fc -ln -1 | xclip -sel c" #Copiar ultimo comando al CB
alias copyf="xclip-copyfile" #Copiar archivo a CB#
alias pastef="xclip-pastefile" #Pegar archivo a CB
alias cutf="xclip-cutfile" #Cortar archivo al CB
alias ipc="go-ip public | xclip -sel clip" #Copiar IP Publica al CB

#########
# Trash #
#########
alias tlist="trash-list"
alias trm="trash-rm"
alias trestore="trash-restore"
alias rm="trash-put"

#######
# Tar #
#######
alias tarh="echo Help: \"tar -cf/-xf <name/path .tar> <files/path to tar>\"" #Mostrar info como hacer un tar
alias tarc="tar -cf" #Crear tar
alias tarx="tar -xf" #Deshacer tar

#Ir a la carpeta con "goto" y abrir VSCode ahi
goc() {
    goto $@
    if [[ $? -eq 0 ]]; then
        code ./
        exit 0
    else 
        echo "$OUTPUT"
    fi
}

#Comando goto
source "$HOME/Archivos/Colegio y Estudio/Z-Proyectos/Go/goto/MyAlias.sh"

#Varaibles SSH
source "$HOME/Scripts/varsSsh.sh"
alias sshs="ssh -X -Y -p $PORT_MY_SSH $IP_MY_SSH"
alias sftps="sftp -P $PORT_MY_SSH $IP_MY_SSH"

scp2server() {
    scp -P $PORT_MY_SSH $@ $IP_MY_SSH:/home/joaco/Temp
}
