#!/bin/bash

    echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>>>>>>>"   
    echo █▀▀ █▀█ █▄░█ █▀ █░█ █░░ ▀█▀ ▄▀█  █▀▄ █▀▀  █░█ █▀ █░█ ▄▀█ █▀█ █ █▀█
    echo █▄▄ █▄█ █░▀█ ▄█ █▄█ █▄▄ ░█░ █▀█  █▄▀ ██▄  █▄█ ▄█ █▄█ █▀█ █▀▄ █ █▄█
    echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>>>>>>>" 

    read -p "Ingrese numero de ticket a buscar: " ticket
    if grep -q "^$ticket:" lista.txt
    then
        grep "^$ticket:" lista.txt>>