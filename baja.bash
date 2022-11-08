#!/bin/bash

  clear

 echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>>>>>>>" 
 echo   █▄▄ ▄▀█ ░░█ ▄▀█  █▀▄ █▀▀  █░█ █▀ █░█ ▄▀█ █▀█ █ █▀█
 echo   █▄█ █▀█ █▄█ █▀█  █▄▀ ██▄  █▄█ ▄█ █▄█ █▀█ █▀▄ █ █▄█
 echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>>>>>>>" 

 read -p "Ingrese numero de ticket a buscar: " ticket
    if grep -q "^$ticket:" lista.txt
    then
        grep "^$ticket:" lista.txt>>bajas.txt
        echo "La falta que ha sido borrada es: " $( grep "^$ticket:" lista.txt )
      
      grep -v "^$ticket:" lista.txt > temp
      mv temp lista.txt
    else
    echo No existe el registro.
    fi
    