#!/bin/bash

clear

 echo   █▄▄ ▄▀█ ░░█ ▄▀█  █▀▄ █▀▀  █▀█ █▀▀ █▀▀ █ █▀ ▀█▀ █▀█ █▀█
 echo   █▄█ █▀█ █▄█ █▀█  █▄▀ ██▄  █▀▄ ██▄ █▄█ █ ▄█ ░█░ █▀▄ █▄█
 echo

 read -p "Ingrese numero de ticket a buscar: " ticket
 cedula=$(grep "^$ticket:" faltas.txt | cut -d ":" -f2)
 usuario=$USER
 lineaTicket=$(grep -n "^$ticket:" faltas.txt | cut -d: -f1)
 fechaLog=$(date +"%D %T")
 
    if grep -q "^$ticket:" faltas.txt
    then
        grep "^$ticket:" faltas.txt>>bajas.txt
        echo $fechaLog"-""El usuario" $usuario "dio de baja al registro de falta con numero de ticket " $ticket "de la cedula "$cedula >>registros.log
        grep -v "^$ticket:" faltas.txt > temp
        mv temp faltas.txt
        echo "La falta que ha sido borrada es: " $( grep "^$ticket:" bajas.txt )
        echo Cerrando aplicacion de registros en 5 segundos!
        sleep 5
    else
    echo No existe el registro.
    fi
    