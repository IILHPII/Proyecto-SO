#!/bin/bash
    clear

    echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"   
    echo  █▀▄▀█ █▀█ █▀▄ █ █▀▀ █ █▀▀ ▄▀█ █▀▀ █ █▀█ █▄░█   █▀▄ █▀▀   █▀▄ ▄▀█ ▀█▀ █▀█ █▀
    echo  █░▀░█ █▄█ █▄▀ █ █▀░ █ █▄▄ █▀█ █▄▄ █ █▄█ █░▀█   █▄▀ ██▄   █▄▀ █▀█ ░█░ █▄█ ▄█
    echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"   
    read -p "Ingrese numero de ticket a buscar: " ticket

    if grep -q "^$ticket:" lista.txt
    then
    while :
    do  
        echo "Datos obtenidos del ticket:" $ticket
        grep "^$ticket:" lista.txt | cut -d ":" -f 2,3,4 | tr -s ':' ' '
        echo "1: Numero de cedula"
        echo "2: Fecha de inicio"
        echo "3: Fecha de fin"
        echo "3: Finalizar"
        read -p "¿Que desea modificar?" ingreso

        case $ingreso in 
            1) cedula=$(grep "$ticket:" lista.txt | cut -d ":" -f 2)
               read -p "Ingrese la nueva CI: " reemplazoci
               sed -i 's/'${cedula}'/'${reemplazoci}'/' lista.txt;;
            2) echo fecha de inicio;;
            3) echo fecha de fin;;
            4) break;;
        esac
    done  
       
    else 
        echo "Ticket inexistente"
    fi        


    