#!/bin/bash
while :
do

echo 


echo      █░█ █▀▀ █░░ █▀█
echo      █▀█ ██▄ █▄▄ █▀▀
echo

echo ¡Bienvenido al menú administrativo de inasistencia docente! 
echo
echo "Esta es una herramienta que permite generar un registros de un docente con su cedula,
hacer un registro de su inasistencia, modificar sus datos y hasta hacer una consulta. 
Siempre para poder hacer un registro de faltas el docente tiene que estar registrado anteriormente en la lista 
(Igualmente el programa te avisara que no estará registrado y te pedirá hacerlo).
A si mismo al momento de modificar, de la baja o la consulta el programa verificará los datos y te dirá sobre cualquier anomalía."
echo
echo
echo ◄El programas se divide en varias funcionalidades► 
echo  ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ 
echo  ░░ ░░ ░░ ░░ ░░ ░░ ░░ ░░ ░░ ░░ ░░ ░░ ░░ ░░ ░░ ░░ ░░ 
echo
echo
echo • Alta de docente
echo
echo "En este apartado se pedirá una cédula de identidad y un nombre a registrar, 
este mismo verificará que no exista en la lista y en caso de que no se registrará correctamente."

echo
echo
echo • Alta de falta
echo
echo "El apartado que le da el nombre al programa, este como bien dice el titulo es para generar la falta del docente, 
al momento del registro te pedirá la cédula de identidad y si existe en la lista te mostrará de quien es, 
paso seguido, te pide los ingresos de la fecha del inicio de la inasistencia y la de fin."
echo
echo
echo • Baja de registro de falta
echo
echo " Como bien dice su nombre es para borrar los registros de faltas, 
este mismo te pedirá el numero de ticket de la falta correspondiente y la eliminará. 
Comprobar que esta eliminada puedes ir al archivo de bajas."

echo
echo
echo • Modificación de registros de faltas
echo
echo "Este apartado te permite modificar un registro según su numero de ticket, 
en este mismo puedes modificar la cedula del docente que se ausento o su fecha de inicio y de fin."

echo
echo
echo • Consulta en registros de faltas
echo
echo "Podrás consultar según el numero de cedula del docente varios apartados como lo son; 
¿Cuales son sus faltas totales? Registro de ausencias en un mes y hasta cuantas veces un usuario registro faltas."

echo
echo
echo  ◄A tener en cuenta►
echo  ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ ▄▄ 
echo  ░░ ░░ ░░ ░░ ░░ ░░ ░░ 
echo
echo
echo • Formato de ingreso de la fecha:
echo
echo "El formato que se pide al momento de ingreso es [yyyymmdd]  sin contra barras ni guiones (Muy importante) luego podrá visualizar en el archivo de faltas que esta perfectamente formateado. "

echo
echo
echo • Ingreso de la cedula:
echo
echo "El ingreso de la cedula es similar al de la fecha ya que se ingresa sin puntos ni guiones además tiene que ingresar su código verificador."

echo
echo
echo • Nombre del docente:
echo
echo "Es importante aclarar que no importa que se repita el nombre del docente,
estos mismos se diferenciarán con su número de cédula ya que es único."

echo
echo
echo • Archivo log
echo "Se dispondrá de un archivo log que guardará el registro con fecha y hora de las acciones que se realicen en el programa tanto de 
baja,alta de docente,alta de falta y modificaciones con el respectivo nombre de usuario que lo realizó. 
Esto mismo es para disponer de un control."
echo "Para poder visualizarlo en la consola escriba “--log” en el menú."

read -p "Para finalizar ingrese la tecla s:" tecla
if [[ $tecla == "s" ]]; then
break
else 
echo "Por favor ingrese la tecla correspondiente"
fi
done