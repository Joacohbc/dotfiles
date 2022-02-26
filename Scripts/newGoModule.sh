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

#
#Creo test.sh
#
touch test.sh

echo "BUILD=\"./testing/$PACKAGE.test\"

#Windows
GOOS=windows GOARCH=amd64 go build -o \"\$BUILD.exe\" ./src/*.go
if [ \"\$?\" == \"0\" ]; then 
    chmod +x \"\$BUILD.exe\"
    echo \"El binario de testing de Windows x64 fue creado con exito\"
fi

#Linux
GOOS=linux GOARCH=amd64 go build -o \"\$BUILD.bin\" ./src/*.go
if [ \"\$?\" == \"0\" ]; then 
    chmod +x \"\$BUILD.bin\"
    echo \"El binario de testing de Linux x64 fue creado con exito\"

    #Y ejecuto el Build
    \$BUILD.bin
fi" > test.sh

chmod +x ./test.sh

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

#Linux
GOOS=linux GOARCH=amd64 go build -o \"\$BUILD.bin\" ./src/*.go
if [ \"\$?\" == \"0\" ]; then 
    chmod +x \"\$BUILD.bin\"
    echo \"El binario de Linux x64 fue creado con exito\"
fi" > make.sh

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