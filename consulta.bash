#!/bin/bash
  clear

   echo   █▀▀ █▀█ █▄░█ █▀ █░█ █░░ ▀█▀ ▄▀█ █▀   █▀▀ █▀▀ █▄░█ █▀▀ █▀█ ▄▀█ █░░ █▀▀ █▀
   echo   █▄▄ █▄█ █░▀█ ▄█ █▄█ █▄▄ ░█░ █▀█ ▄█   █▄█ ██▄ █░▀█ ██▄ █▀▄ █▀█ █▄▄ ██▄ ▄█


    #Variables utiles
    validate_entrada_ci='^[0-9]+$'
    let resultDay
  while :
  do
    echo 
    echo "Bienvenido a las consultas"
    echo "1) Cantidad de avisos en un mes de determinado docente"
    echo "2) Total de faltas de un determinado profesor"
    echo "3) Listado de ausencias de un determinado profesor"
    echo "4) Cantidad de registros de un determinado usuario en un mes"
    echo "5) Consultar lista de profesores"
    echo "6) Salir de consultas"
    read -p "Opcion: " opcion

    case $opcion in
    1) read -p "Ingrese la cedula a consultar:" cedula
       read -p "Ingrese el mes que el desea buscar la cantidad de faltas en formato [mm]:" mes

       if grep -q ":$cedula:" faltas.txt ; then
        for xx in $(grep ":$cedula:" faltas.txt | cut -d: -f3)
        do
          buscoMes=$(date -d "$xx" +%m)
          if [[ $buscoMes == $mes ]]; then
            let registros++
          else
            registros=0
          fi 
        done  
        echo "La cantidad de registros en el mes " $mes "es de" $registros
          else 
          echo "Cedula no encontrada en registro de faltas"
        fi
        registros=0
        ;;
    2) 
      read -p "Ingrese cedula a continuacion: " cedula 
        if grep -q ":$cedula:" faltas.txt ; then 
        
        for y in $(grep ":$cedula:" faltas.txt | cut -d: -f3 ) 
         do
          let iniDate+=$(date -d"$y" +%s)
         done
          
          for x in $(grep ":$cedula:" faltas.txt | cut -d: -f4 ) 
            do 
               let finDate+=$(date -d"$x" +%s)
            done

            let resultUnix=$finDate-$iniDate

            if [[ $resultUnix == 0 ]]; then
               resultado=1
              echo "El total de faltas es: " $resultado
              else
               let endResult=$resultUnix/86400
               echo "El total de faltas es: " $endResult
            fi

          else
           echo "Cedula no encontrada en el registros de faltas" 
        fi
        resultUnix=0
        endResult=0
            ;;
    3)  read -p "Ingrese cedula a continuacion: " cedula 
        if grep -q ":$cedula:" faltas.txt ; then 
         (echo CI:Fecha Inicio:Fecha Fin; cat faltas.txt | grep ":$cedula:" | cut -d: -f 2,3,4 ) | column -t -s:
            else
            echo "Cedula no encontrada en el registro de faltas"
        fi  
         ;;
    4) read -p "Ingrese nombre del usuario que registro la falta:" nombre
       read -p "Ingrese el mes que el desea buscar la cantidad de registros en formato [mm]:" mes
      if grep -q ":$nombre" faltas.txt ; then 
       for xx in $(grep ":$nombre" faltas.txt | cut -d: -f5)
        do
          buscoMes=$(date -d "$xx" +%m)
          if [[ $buscoMes == $mes ]]; then
            let registros++
          else
            echo "No existen registros del mes " $mes 
          fi 
        done  
        echo "La cantidad de registros en el mes " $mes "es de" $registros
         else
         echo "Usuario no encontrado en el registro de faltas"
      fi   
      registros=0
      ;;
    5)
      (echo CI:Nombre; cat lista.txt |  cut -d: -f1,2) | column -t -s:
    ;;
    6) break
    ;;  
    esac
  done