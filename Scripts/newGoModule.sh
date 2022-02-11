#INFO: Crear un Go module con su repo en Git

if [ "$1" == "" ];then
    echo "El nombre del paquete no puede estar vacio"
    exit
fi

##################
#-Crear carpetas-#
##################

#Nombre del Projecto/Paquete
PACKAGE="$1"

mkdir "./"$PACKAGE
cd "./"$PACKAGE

#Creo los paquetes necesarios
mkdir ./bin
mkdir ./src
mkdir ./testing

#############################
#-Crear go module y main.go-#
#############################

#Inicializo Modulo
go mod init $PACKAGE

#Creo Main.go
touch main.go

echo "package main

import \"fmt\"

func main() {
    fmt.Println(\"Hola Mundo!\")
}
" > main.go

mv ./main.go ./src/main.go

#####################################
#-Crear script de test.sh y make.sh-#
#####################################

#Creo test.sh
touch test.sh

echo "BUILD=\"./testing/$PACKAGE.test\"

go build -o \$BUILD ./src/*.go

if [ "$?" == "0" ]; then 
    chmod +x \$BUILD
    \$BUILD
fi" > test.sh

chmod +x ./test.sh

#Creo make.sh
touch make.sh

echo "BUILD=\"./bin/$PACKAGE.bin\"

go build -o \$BUILD ./src/*.go

if [ "$?" == "0" ]; then 
    chmod +x \$BUILD
    echo \"El binario fue creado con exito\"
fi" > make.sh

chmod +x ./make.sh

#########################
#-Crear repositorio Git-#
#########################

git init ./
git add -A

#################################
#-Preguntar si abrir con VsCode-#
#################################

#Pregunto si quiere abrirlo en VSCode
echo ""
echo "¿Abrir \"./$PACKAGE\" en Visual Studio Code? (y/any)"
read op

if [ "$op" == "y" ]; then
    #cd ./$PACKAGE
    code ./ 
fi
