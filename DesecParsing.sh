#!/bin/bash
Y='\033[1;33m'
NC='\033[0m'

if [ "$1" == "" ]
then 
	echo -e "${Y}#########################################" 
	echo -e "${Y}|->            PARSING HTML           <-|"
	echo -e "${Y}|-> Desec Security - Gabriel Santana  <-|"
	echo -e "${Y}|-> ./DesecParsing.sh www.alvo.com.br <-|"
	echo -e "${Y}#########################################"
else

wget -q $1
	echo -e "${Y}###########################################" 
        echo -e "${Y}|->         Buscando Hosts...           <-|"
        echo -e "${Y}###########################################${NC}"

grep href index.html | cut -d "/" -f 3 | grep "\." | cut -d '"' -f 1 | grep -v "<l" > lista
cat lista
        echo -e "${Y}###########################################" 
        echo -e "${Y}|->         Resolvendo Hosts...         <-|"
        echo -e "${Y}###########################################${NC}"

for url in $(cat lista);
do
	host $url | grep "has address";
done
fi
