#!/bin/bash
clear 

#Variables utiles
validate_entrada_ci='^[0-9]+$'
validate_entrada_nombre='^[A-Za-zÁÉÍÓÚáéíóú0-9]+$'
comparadorCedula=$(grep "^$cedula:" lista.txt | cut -d: -f1)

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
            break; 
    fi
    
    sleep 1
    
    if   grep -q "^$cedula:" lista.txt  ; then
         echo Cedula ya existente en el sistema
         (echo CI:Nombre; cat lista.txt | grep "^$cedula:" | cut -d: -f 1,2 ) | column -t -s:
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
            break;
        else
            echo Intente el registro nuevamente.
    fi
        
done

