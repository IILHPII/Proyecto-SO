#!/bin/bash

      #Variables utiles
      validate_entrada_ci='^[0-9]+$'
      let resultDay

    echo "Bienvenido a las consultas"
    echo "1) Consulta general por cedula"
    echo "2) Cantidad de avisos en un mes de determinado docente"
    echo "3) Total de faltas de un determinado profesor"
    echo "4) Listado de ausencias de un determinado profesor"
    echo "5) Cantidad de registros de un determinado usuario en un mes"
    read -p "Opcion: " opcion

    case $opcion in
    1) read -p "Ingrese cedula a continuacion: " cedula 
         (echo CI:Fecha Inicio:Fecha Fin; cat faltas.txt | grep ":$cedula:" | cut -d: -f 2,3,4 ) | column -t -s:
         ;;
    2) read -p "Ingrese cedula a continuacion: " cedula 
      
      for y in $(grep ":$cedula:" faltas.txt | cut -d: -f3 ) 
         do
            iniDate=$(date -d"$y" +%s)

            for x in $(grep ":$cedula:" faltas.txt | cut -d: -f4 ) 
            do 
               finDate=$(date -d"$x" +%s)
               let result=$finDate-$iniDate
                 if [[ $result == 0 ]] ; then
                  resultUnix=1
                  let resultDay+=$resultUnix
               else
                  let resultDay=$result/86400
               fi 
            done
         done
         echo $resultDay
       ;;
    3) echo consulta de total de faltas de profesor;;
    4) echo listado de ausencias de determinado profesor;;
    5) echo cantidad de registros de un usuario en un mes;;
    esac