#!/bin/bash
    echo 
    echo
    while :
    do
    echo      █░░ █▀█ █▀▀
    echo      █▄▄ █▄█ █▄█
    echo
    cat registros.log
    echo
    read -p "Para finalizar ingrese la tecla s:" tecla
    if [[ $tecla == "s" ]]; then
    break
    else 
    echo "Por favor ingrese la tecla correspondiente"
    fi
    done
