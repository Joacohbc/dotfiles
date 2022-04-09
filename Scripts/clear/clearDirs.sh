#INFO: Borrar archivos de directorios 

clearDir() {
    
    #Guardo el arg 1 en $DIR
    local DIR="$1"

    #Si el fichero no existe, lo imprimo y retorno
    if [ ! -e $DIR ]; then
        echo "El fichero \"$DIR\" no existe"
        return
    fi

    #Si el fichero no existe, lo imprimo y retorno
    if [ ! -d $DIR ]; then
        echo "El fichero \"$DIR\" no es un directorio"
        return
    fi

    #Cuento cuantos archivos hay en $DIR
    FILES=`ls $DIR | wc -l`

    #Si en $DIR hay archivos
    if [ $FILES -gt 0 ]; then
        cd $DIR
        trash-put ./*

        if [ "$?" == 0 ]; then 
            echo "El directorio \"$DIR\" se vacio"
        fi
    else
        echo "El directorio \"$DIR\" esta vacio"
    fi
}

echo "¿Borrar carpeta Descargas y Temp? (y/any)"
read op

if [ "$op" == "y" ]; then
    clearDir $HOME/Descargas
    clearDir $HOME/Temp
fi
