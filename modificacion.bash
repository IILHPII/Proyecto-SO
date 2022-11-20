#!/bin/bash
    clear

    echo  █▀▄▀█ █▀█ █▀▄ █ █▀▀ █ █▀▀ ▄▀█ █▀▀ █ █▀█ █▄░█   █▀▄ █▀▀   █▀▄ ▄▀█ ▀█▀ █▀█ █▀
    echo  █░▀░█ █▄█ █▄▀ █ █▀░ █ █▄▄ █▀█ █▄▄ █ █▄█ █░▀█   █▄▀ ██▄   █▄▀ █▀█ ░█░ █▄█ ▄█ 
    echo 
    
    read -p "Ingrese numero de ticket a buscar: " ticket

    cedula=$(grep "^$ticket:" faltas.txt | cut -d ":" -f2)
    validate_entrada_fecha='^(19[0-9]{2}|20[0-9]{2})(0[1-9]|10|11|12)(0[1-9]|1[0-9]|2[0-9]|3[0-1])$'
    fechaFinVieja=$(grep "^$ticket:" faltas.txt | cut -d ":" -f4)
    fechaInicioVieja=$(grep "^$ticket:" faltas.txt | cut -d ":" -f3)
    validate_entrada_ci='^[0-9]+$'
    usuario=$USER
    fecha=$(date +%Y/%m/%d)
    lineaTicket=$(grep -n "^$ticket:" faltas.txt | cut -d: -f1)
    fechaLog=$(date +"%D %T")

    while :
    do  

    if grep -q "^$ticket:" faltas.txt
    then
    
        echo "Datos obtenidos del ticket:" $ticket
        (echo CI:Fecha Inicio:Fecha Fin; cat faltas.txt | grep "^$ticket:" | cut -d: -f 2,3,4 ) | column -t -s:
        echo "1: Numero de cedula"
        echo "2: Fecha de inicio y de fin"
        echo "3: Finalizar el programa"
        read -p "¿Que desea modificar?" ingreso
        
        case $ingreso in 
            1) 
               read -p "Ingrese la nueva CI: " reemplazoci
            if grep -q "$reemplazoci" lista.txt ; then
                if [[ $reemplazoci =~ $validate_entrada_ci ]] ; then
                sed -i ${lineaTicket}' s/'${cedula}'/'${reemplazoci}'/' faltas.txt
                echo $fechaLog"-""El usuario" $usuario "cambio la cedula" $cedula "por la cedula " $reemplazoci >>registros.log
                echo $lineaTicket
                else
                echo "Ingreso invalido, intente nuevamente."
                fi
               else
                echo "Cedula a reemplazar no encontrada en el sistema"
            fi   
               ;;
            2) 
               read -p "Ingrese la nueva fecha de inicio en formato [yyyyMMdd]:" fechaInicio
               if [[ $fechaInicio =~ $validate_entrada_fecha ]]; then 
                anio=${BASH_REMATCH[1]}
                mes=${BASH_REMATCH[2]}
                dia=${BASH_REMATCH[3]}
                fechaInicioCompleta="$anio/$mes/$dia"
               else 
                echo "Ingreso invalido, intente nuevamente."
               fi
               read -p "Ingrese la nueva fecha de fin en formato [yyyyMMdd]:" fechaFin
               if [[ $fechaFin =~ $validate_entrada_fecha ]]; then 
                anio=${BASH_REMATCH[1]}
                mes=${BASH_REMATCH[2]}
                dia=${BASH_REMATCH[3]}
                fechaFinCompleta="$anio/$mes/$dia"
               else 
                echo "Ingreso invalido, intente nuevamente."
               fi 

               if [[  $fechaInicioCompleta < $fechaFinCompleta || $fechaInicioCompleta == $fechaFinCompleta ]] ; then
               sed -i ${lineaTicket}' s:'${fechaInicioVieja}':'${fechaInicioCompleta}':' faltas.txt
               sed -i ${lineaTicket}' s:'${fechaFinVieja}':'${fechaFinCompleta}':' faltas.txt
               echo $fechaLog"-""El usuario "$usuario "cambio la fecha de inicio "$fechaInicioVieja "por la fecha "$fechaInicioCompleta "del docente "$cedula >>registros.log
               echo $fechaLog"-""El usuario "$usuario "cambio la fecha de fin "$fechaFinVieja "por la fecha "$fechaFinCompleta "del docente "$cedula >>registros.log
               else 
                echo "Ingreso invalido, intente nuevamente."
               fi;;
            3) break;;
        esac
       
        else 
        echo "Ticket inexistente"
        fi        
    done      

    