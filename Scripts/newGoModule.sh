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

########################
#-Crear script make.sh-#
########################

#
#Creo make.sh
#
touch make.sh

echo "BUILD=\"./bin/$PACKAGE\"

#Windows
GOOS=windows GOARCH=amd64 go build -o \"\$BUILD.exe\" ./src/*.go
if [ \"\$?\" == \"0\" ]; then 
    chmod +x \"\$BUILD.exe\"
    echo \"El binario de Windows x64 fue creado con exito\"
fi

#Linux x64
GOOS=linux GOARCH=amd64 go build -o \"\$BUILD.bin\" ./src/*.go
if [ \"\$?\" == \"0\" ]; then 
    chmod +x \"\$BUILD\"\"64.bin\"
    echo \"El binario de Linux x64 fue creado con exito\"
fi

#Linux
GOOS=linux GOARCH=386 go build -o \"\$BUILD.bin\" ./src/*.go
if [ \"\$?\" == \"0\" ]; then 
    chmod +x \"\$BUILD\"\"32.bin\"
    echo \"El binario de Linux x32 fue creado con exito\"
fi
" > make.sh

chmod +x ./make.sh

#########################
#-Crear repositorio Git-#
#########################

echo ""
echo "¿Iniciar repositorio Git? (y/any)"
read op

if [ "$op" == "y" ]; then
    git init ./

    touch .gitignore

    echo "
    testing/*
    *.sh
    .vscode/*
    " > .gitignore

    git add -A
fi

#################################
#-Preguntar si abrir con VsCode-#
#################################

#Pregunto si quiere abrirlo en VSCode
echo ""
echo "¿Abrir \"./$PACKAGE\" en Visual Studio Code? (y/any)"
read op

if [ "$op" == "y" ]; then
    code ./ 
fi