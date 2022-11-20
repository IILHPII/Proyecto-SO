#!/bin/bash
 clear 

    echo    ▄▀█ █░░ ▀█▀ ▄▀█   █▀▄ █▀▀   █▀▄ █▀█ █▀▀ █▀▀ █▄░█ ▀█▀ █▀▀
    echo    █▀█ █▄▄ ░█░ █▀█   █▄▀ ██▄   █▄▀ █▄█ █▄▄ ██▄ █░▀█ ░█░ ██▄
    echo


 #Variables utiles
 validate_entrada_ci='^[0-9]+$'
 validate_entrada_nombre='^[A-Za-zÁÉÍÓÚáéíóú0-9]+$'
 comparadorCedula=$(grep "^$cedula:" lista.txt | cut -d: -f1)
 usuario=$USER
 fechaLog=$(date +"%D %T")

 while :
    do

    read -p "Ingrese la cedula a registrar: " cedula
    sleep 1
    echo Se evaluara si la cedula es valida y no esta registrada en el sistema
    sleep 1
    if [[  $cedula =~ $validate_entrada_ci ]] ; then
            echo Entrada de cedula de identidad valida
            guardarCi="$cedula"
        else 
            echo La cedula ingresada es invalida.
            sleep 5
            break; 
    fi
    
    sleep 1
    
    if   grep -q "^$cedula:" lista.txt  ; then
         echo Cedula ya existente en el sistema
         (echo CI:Nombre; cat lista.txt | grep "^$cedula:" | cut -d: -f 1,2 ) | column -t -s:
         sleep 5
         break
        else 
         echo Cedula no existente en el sistema, puede continuar.
         validacionCedula=true
    fi

 read -p "Ingrese nombre de la persona: " nombre
    if [[  $nombre =~ $validate_entrada_nombre ]] ; then
        echo Entrada de nombre valida
        guardarNombre="$nombre"
        validacionNombre=true
        else 
        echo Valor incorrecto, intente nuevamente
    fi

    if [ $validacionNombre=true ] && [ $validacionCedula=true ] ; then
            echo $guardarCi":"$guardarNombre >>lista.txt
            echo "Los datos guardados son: "
            (echo CI:Nombre; cat lista.txt | grep "^$cedula:" | cut -d: -f 1,2 ) | column -t -s:
            echo $fechaLog"-""El usuario" $usuario "dio de alta al docente " $guardarNombre "con la cedula " $guardarCi >>registros.log
            sleep 2
            echo Cerrando aplicacion de registros en 5 segundos!
            sleep 5
            break;
        else
            echo Intente el registro nuevamente.
    fi
        
 done

