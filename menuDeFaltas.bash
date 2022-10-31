#!/bin/bash

#Variables utiles
fecha=$(date +%y/%m/%d)
user=$USER
validate_entrada_ci='^[0-9]+$'
validate_entrada_fecha='^(19[0-9]{2}|20[0-9]{2})(0[1-9]|10|11|12)(0[1-9]|1[0-9]|2[0-9]|3[0-1])$'
counter=`echo $(($RANDOM))`


#Opciones del menu
opciones=("Leer fichero" "Alta en fichero" "Consulta por Cedula de identidad")

#Case del menu
select opcion in "${opciones[@]}";
do
    case $opcion in
        "Leer fichero") 
        cat lista.txt
    ;;

    "Alta en fichero")
        while :
        do

         read -p "Ingrese cedula: " cedula
            if [[ $cedula =~ $validate_entrada_ci ]]; then 
                break;
            else 
                echo " '$cedula' no es una cedula valida"
            fi
            
        done

        sleep 1

        while :
        do

            while :
        do
            echo "Ingrese fecha que inicio inasistencia"
            read -p "Ingrese la fecha en formato [yyyyMMdd]: " fechaInicio

            if [[ $fechaInicio =~ $validate_entrada_fecha ]]; then 
                anio=${BASH_REMATCH[1]}
                mes=${BASH_REMATCH[2]}
                dia=${BASH_REMATCH[3]}
                fechaInicioCompleta=" $anio/$mes/$dia"
                break;
           else        
                echo "$iniFecha' no es una fecha valida"
            fi
        done

        while :
            do
            echo "Ingrese fecha que finalizo inasistencia"
            read -p "Ingrese la fecha en formato [yyyyMMdd]: " fechaFin

            if [[ $fechaFin =~ $validate_entrada_fecha ]]; then 
                anio=${BASH_REMATCH[1]}
                mes=${BASH_REMATCH[2]}
                dia=${BASH_REMATCH[3]}
                fechaFinCompleta=" $anio/$mes/$dia"
                break;
            else 
                echo "$fechaFin' no es una fecha valida"
            fi
    
            done



            if (($fechaInicio > fechaFin)) ; then
            echo "La fecha de Inicio no puede ser mas reciente que la fecha del fin"
            else
            break;    
            fi

        done

        echo $counter     ":" $cedula ":" $fechaInicioCompleta ":" $fechaFinCompleta ":" $fecha ":" $user >>lista.txt
        echo Tu codigo es: $counter  guardalo para consultar tus datos de la inasistencia
    ;;


    "Consulta por Cedula de identidad")
        read -p "Ingrese cedula de identidad: " cedula
        for x in $( cut -f 2-4 -d: lista.txt | grep "^$cedula" )
        do
           ini=$(echo $x | cut -f2 -d:)
           fin=$(echo $x | cut -f3 -d:)
           dif=$(($fin-$ini+1))
           total=$(($total+dif))
        done
        echo faltar en $total
        ;;
    esac
done    