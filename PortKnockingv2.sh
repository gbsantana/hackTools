#!/bin/bash
if [ "$1" == "" ]
then
        echo " PortKnocking + scannet"
        echo "Modo de uso - $0 IP PORTA(S) na ordem desejada PORTA ABERTA"
        echo "Exemplo: $0 10.59.174. 80 1000 444"
else
# Para remover o IP dos argumentos e o for funcionar
IP=$1
shift

# a diferenca eh a juncao desse com o for dos ips
for subips in $(seq 0 255);
do
	for port in "$@";
	do
	hping3 -S -p $port -c 1 $IP.$subips 2> /dev/null | grep "flags=SA" | cut -d " " -f 2 
	done
done
fi
