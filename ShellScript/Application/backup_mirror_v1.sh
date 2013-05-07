#!/usr/bin/env bash

###
#	Backup script
#	Check a destiny and create a mirror
#	This script use "rsync" and KeySSH
#	
#	by Antonio Thomacelli Gomes
#	Date 07/06/2013 | Edited 07/06/2013 | Version 1.0
###
####

###
#	Start Variable
###

ADDRESS_LIST="./list.txt"; # <- Create a file with address to check
ADDRESS_FILE="";
TOTAL_ITEM_CHECK=`wc -l $ADDRESS_LIST | awk '{ print $1}'`;
DAY=`date +%d`;
MONTH=`date +%m`;
YEAR=`date +%Y`;
###	End Variable
####

clear;
for ((i=1; i<$TOTAL_ITEM_CHECK+1;i++))
do
	DESTINY=`sed -n $i' p;' $ADDRESS_LIST`;
	echo $DESTINY;
done





###
####	End Script
