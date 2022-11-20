#!/bin/bash
    while :
    do  
    clear

    echo █▀▄▀█ █▀▀ █▄░█ █░█
    echo █░▀░█ ██▄ █░▀█ █▄█
    echo
   
    echo "1) Alta de docente"
    echo "2) Registro de falta"
    echo "3) Baja de registro de falta"
    echo "4) Modificacion de registros de falta"
    echo "5) Consulta en registro de faltas"
    echo "6) Terminar programa"
    echo 
    read -p "Ingrese seleccion del menu: " menu
    
   if [[ $menu == "--help" ]]; then
    echo "Ayuda!"
      else 
       case $menu in

       1) bash altaDocente.bash;;

       2) bash altaDeFalta.bash;;

       3) bash baja.bash;;

       4) bash modificacion.bash;;

       5) bash consulta.bash ;;

       6) echo "Cerrando menu."
       break;;
       
       esac
   fi

    done





