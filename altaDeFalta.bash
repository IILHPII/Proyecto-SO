#!/bin/bash

#Variables utiles
fecha=$(date +%Y/%m/%d)
user=$USER
validate_entrada_ci='^[0-9]+$'
validate_entrada_fecha='^(19[0-9]{2}|20[0-9]{2})(0[1-9]|10|11|12)(0[1-9]|1[0-9]|2[0-9]|3[0-1])$'
counter=`echo $(($RANDOM))`

    clear
    echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>>>>>>>"             
    echo    ▄▀█ █░░ ▀█▀ ▄▀█   █▀▄ █▀▀  █░█ █▀ █░█ ▄▀█ █▀█ █ █▀█
    echo    █▀█ █▄▄ ░█░ █▀█   █▄▀ ██▄  █▄█ ▄█ █▄█ █▀█ █▀▄ █ █▄█ 
    echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>>>>>>>"
    
    #Bucle 
    while :
        do

        read -p "Ingrese cedula: " cedula
        
        buscoDocente=$(grep "^$cedula:" lista.txt | cut -d: -f2)

        if grep -q "^$cedula:" lista.txt ; then
            echo Cedula valida,pertenece al docente $buscoDocente
           else 
            echo Cedula no registrada en el sistema,primero debe dar de alta al profesor
            break;
        fi

        echo "Ingrese fecha que inicio inasistencia"
        read -p "Ingrese la fecha en formato [yyyyMMdd]: " fechaInicio

        #Validador fecha
        if [[ $fechaInicio =~ $validate_entrada_fecha ]]; then 
                anio=${BASH_REMATCH[1]}
                mes=${BASH_REMATCH[2]}
                dia=${BASH_REMATCH[3]}
                fechaInicioCompleta="$anio/$mes/$dia"
                inicio_authenticator=true
               
           else        
                inicio_authenticator=false
        fi     
           
        echo "Ingrese fecha que finalizo inasistencia"
        read -p "Ingrese la fecha en formato [yyyyMMdd]: " fechaFin   
        
        #Validador fecha
        if [[ $fechaFin =~ $validate_entrada_fecha ]]; then 
                anio=${BASH_REMATCH[1]}
                mes=${BASH_REMATCH[2]}
                dia=${BASH_REMATCH[3]}
                fechaFinCompleta="$anio/$mes/$dia"
                fin_authenticator=true
            else 
                fin_authenticator=false
        fi    

        #Validador cedula
        if [[ $cedula =~ $validate_entrada_ci ]] ; then 
            ci_authenticator=true
        else 
            ci_authenticator=false
        fi

           
        #Validador general   
        if [ $fin_authenticator = true ] && [ $inicio_authenticator = true ] && [ $ci_authenticator = true ] && [[  $fechaInicioCompleta < $fechaFinCompleta || $fechaInicioCompleta == $fechaFinCompleta ]] ; then 
            echo $counter":"$cedula":"$fechaInicioCompleta":"$fechaFinCompleta":"$fecha":"$user >>faltas.txt
            echo Tu codigo es: $counter  guardalo para consultar tus datos de la inasistencia
            break;
        else 
            echo Datos no validos, verifique que ingreso mal en el siguiente panel de texto: 
            echo "Cedula:" $cedula "|" "Fecha de fin: "$fechaFin "|" "Fecha de inicio: "$fechaInicio     
        fi
            
    done