#!/usr/bin/env bash

###
#	Script to check services stats
#	Created 26/04/2013
#	by Antonio Thomacelli Gomes
#	http://www.linuxresort.blogspot.com.br
###

###
#	1 - Test ping
#	2 - Check memory
#	3 - Check disk
#	4 - Check % CPU
#	5 - Temperature CPU
###

ADDRESS_LOCAL="127.0.0.1";
ADDRESS_GATEWAY="192.168.4.14";
ADDRESS_DNS="192.168.4.15";

### Start Check Ping
#	1/3 - Check ping Local

        if [ `ping $ADDRESS_LOCAL -c 6 | grep 64 | wc -l` -ge 2 ];then
		echo "Pingando $ADDRESS_LOCAL";
	else
		echo "ERRO $ADDRESS_LOCAL Inativo";
	fi
#       2/3 - Check ping dns

        if [ `ping $ADDRESS_GATEWAY -c 6 | grep 64 | wc -l` -ge 2 ];then
                echo "Pingando $ADDRESS_GATEWAY";
        else
                echo "ERRO $ADDRESS_GATEWAY Inativo";
        fi

#       3/3 - Check ping DNS

        if [ `ping $ADDRESS_DNS -c 6 | grep 64 | wc -l` -ge 2 ];then
                echo "Pingando $ADDRESS_DNS";
        else
                echo "ERRO $ADDRESS_DNS Inativo";
        fi
#
### End Check Ping

### Check Memory
#
echo "This check count Memory and Swap memory"


 TOTAL_MEMORY=`free -t -m | tail -n 1 | awk '{ print $2}'`;
 MEMORY_USED=`free -t -m | tail -n 1 | awk '{ print $3}'`;
 PERCENT=`echo $(( (100 * MEMORY_USED)/ $TOTAL_MEMORY ))`; 
 
 echo "TOTAL: $TOTAL_MEMORY";
 echo "USADA: $MEMORY_USED";
 echo "PORCENTAGEM: $PERCENT";

 if [ '$PERCENT' > '90' ];then
  echo "Porcentagem acima $PERCENT";
 else
  echo "Porcentagem abaixo $PERCENT";
 fi

#
### End Check Memory

### Start Check Disk
#

 PORCENT_DISK=`df -h -l / --total | tail -n 1 | awk '{ print $5}'| cut -c1-2`;
 echo $PORCENT_DISK;
 if [ 'PORCENT_DISK' < 90 ];then
  echo "ERRO Alerta de disco muito cheio";
 else
  echo "Disco com $PORCENT_DISK de uso";
 fi

#
###

echo "Script Check End!";
