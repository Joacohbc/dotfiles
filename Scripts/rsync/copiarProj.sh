#Enviar la carpeta actual al servidor 192.168.0.250

SSH_DESTINO="joaco@192.168.0.250"
DESTINO="/home/joaco/Projectos/"
ORGIEN="/home/joaco/Archivos/Colegio y Estudio/Z-Proyectos/"

rsync -vatu --delete --rsh="ssh -p4004" --exclude "copiar.sh" "$ORGIEN" "$SSH_DESTINO":"$DESTINO"

: '
El parámetro -a significa que el copiado se realizará de forma recursiva, es decir, se 
copiarán todos los directorios, subdirectorios y ficheros almacenados en todos ellos.

El parámetro -t provocará que el tiempo de modificación de cada fichero sea el mismo 
tanto en el directorio_origen como en el directorio_destino.

El parámetro -v significa que se mostrará más información durante el proceso de 
sincronización y así ver el progreso del comando.

El parámetro -u significa que se actualizarán solamente los ficheros y directorios 
diferentes entre el directorio_origen y el directorio_destino

El parámetro --delete significa que borrarán del directorio_destino los ficheros 
que no existan en el directorio_origen

El parámetro -v significa que mostrara todo lo que hace

El parámetro --rsh es para indicar con que parametros queremos usar SSH
'
