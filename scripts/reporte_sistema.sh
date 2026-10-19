#!/bin/bash
echo "====================================="
echo "      REPORTE DEL SISTEMA            "
echo "====================================="

echo "Fecha y hora actual"
current_date=$(date "+%D")
current_hour=$(date "+%T")
echo "Fecha actual y hora: $current_date  $current_hour"

echo " "
echo "Host del Sistema"
hostname

echo " "
echo "Numero de Usuarios Conectados"
who | wc -l

echo " "
echo "Espacio Libre en el Diso principal"
df -h / | awk 'NR==2 {print "Disponible: " $4}'
echo " "

echo "RAM Libre"
free -h | awk '/^Mem:/ {print "Disponible: " $7}'

echo " "
echo "Numero de Contenedores Docker Activos"
if command -v docker >/dev/null 2>&1; then
	docker ps -q | wc -l
else 
	echo "Docker no Instalado"
fi
echo " "
