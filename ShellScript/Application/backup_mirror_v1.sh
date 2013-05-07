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
#	Start Variable
###

ADDRESS_LIST="./list.txt"; # <- Create a file with address/ip to check
ADDRESS_FILE="/root/infra/backup/diario"; # <- Add address folder to creata a mirror/Backup
TOTAL_ITEM_CHECK=`wc -l $ADDRESS_LIST | awk '{ print $1}'`; # Total itens have inside address list
DAY=`date +%d`;
MONTH=`date +%m`;
YEAR=`date +%Y`;


###	End Variable
####

clear;
for ((i=1; i<$TOTAL_ITEM_CHECK+1;i++))
do
	clear;
	DESTINY=`sed -n $i' p;' $ADDRESS_LIST`;
	STATUS="Offline";
	echo "Checking $DESTINY";
	[ `ping $DESTINY -c 6 | grep 64 | wc -l` -ge 2 ] && {
		STATUS="Online";
        }
	echo "$DESTINY : $STATUS";

	#[ $STATUS = "Online" ] && {
	#	ssh root@$DESTINY '
	#	ls /home/infra/backup/diario; # <- Change the address
	#' ;
        #

	rsync --partial -r --rsh='ssh -p221' --delete-excluded $DESTINY:$ADDRESS_FILE $

	#[ ] && {}
	#[ ] || {}	
done
###
####	End Script
