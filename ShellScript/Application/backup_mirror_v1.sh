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

ADDRESS_LIST="./list.txt"; # <- Create a file with address to check
ADDRESS_FILE="/root/infra/backup/diario";
TOTAL_ITEM_CHECK=`wc -l $ADDRESS_LIST | awk '{ print $1}'`;
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

	[ $STATUS = "Online" ] && {
		ssh root@$DESTINY '

		ls /home/infra/backup/diario; # <- Change the address

		' ;
        }
	#[ ] && {}
	#[ ] || {}	
done
###
####	End Script
