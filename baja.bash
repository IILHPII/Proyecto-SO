#!/bin/bash

  clear

 echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>>>>>>>" 
 echo   █▄▄ ▄▀█ ░░█ ▄▀█  █▀▄ █▀▀  █░█ █▀ █░█ ▄▀█ █▀█ █ █▀█
 echo   █▄█ █▀█ █▄█ █▀█  █▄▀ ██▄  █▄█ ▄█ █▄█ █▀█ █▀▄ █ █▄█
 echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>>>>>>>" 

 read -p "Ingrese numero de ticket a buscar: " ticket
    if grep -q "^$ticket:" faltas.txt
    then
        grep "^$ticket:" faltas.txt>>bajas.txt
        echo "La falta que ha sido borrada es: " $( grep "^$ticket:" lista.txt )
      
      grep -v "^$ticket:" faltas.txt > temp
      mv temp lista.txt
    else
    echo No existe el registro.
    fi
    