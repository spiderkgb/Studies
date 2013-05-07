#!/usr/bin/env bash

###
#	Backup script
#	Check a destiny and create a mirror
#	This script use "rsync" and Confiance KeySSH
#	
#	by Antonio Thomacelli Gomes
#	Date 07/06/2013 | Edited 07/06/2013 | Version 1.0
###
####

###
#	Help
###
#	First  step - Create a file with address you like check line by line
#	Second step - Run SchellScript
#	( You can add backup_script to start with contrab )
###


###
#	Start
###

ADDRESS_LIST="./list.txt"; # <- Create a file with address/ip to check
ADDRESS_FILE="/home/infra/Test"; # <- Add address folder to creata a mirror/Backup
TOTAL_ITEM_CHECK=`wc -l $ADDRESS_LIST | awk '{ print $1}'`; # Total itens have inside address list
ADDRESS_BKP="/home/infra/Temporario/Teste"; # <- Insert here address, if remote addres use 127.0.0.1:/folder/backup 
#PORT="221"; # <- Change here the port will be used, default port is 22

clear;
for ((i=1; i<$TOTAL_ITEM_CHECK+1;i++))
do
	clear;
	TARGET=`sed -n $i' p;' $ADDRESS_LIST`;
	STATUS="Offline";
	echo "Checking $TARGET";
	[ `ping $TARGET -c 6 | grep 64 | wc -l` -ge 2 ] && {
		STATUS="Online";
        }
	echo "$TARGET : $STATUS";

	rsync --partial -r --rsh='ssh -p221' --delete-excluded $TARGET:$ADDRESS_FILE $ADDRESS_BKP;
	sleep 2;
done
###
####	End Script
