#!/bin/bash
if [ "$1" == "" ]
then
	echo " PortKnocking "
	echo "Modo de uso - $0 IP PORTA(S) na ordem desejada"
	echo "Exemplo: $0 10.59.174.235 80 1000 444"
else
# Para remover o IP dos argumentos e o for funcionar
IP=$1
shift

for port in "$@";
do
hping3 -S -p $port -c 1 $IP 2> /dev/null | grep "flags=SA"; 
done
fi
