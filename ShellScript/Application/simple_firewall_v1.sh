#!/usr/bin/env bash

BOARD_IN="eth0";
BOARD_OUT="";
BOARD_LO="lo";

function version(){
echo """
###
#
#	Firewall with iptables
#	by Antonio Thomacelli Gomes
##	
#	Created : 06/05/2013
#	Edited  : 15/05/2013
#	Version : 1.0
#
###
""";
}

function stats(){
iptables -L;
version;
}

function started(){
clear;
echo "Firewall Start";
echo "Clean Rules";
iptables -F

echo "Default Rules";
iptables -P INPUT DROP
iptables -P OUTPUT DROP
iptables -P FORWARD DROP


## Start Allow Rules
#
 ##
 # INPUT
 echo "INPUT";
 ##
  # INPUT Accept interface lo
  iptables -A INPUT -i $BOARD_LO -j ACCEPT

  # INPUT Accept internet ESTABLISHED
  iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

  # Accept packages of DHCP
  #iptables -A INPUT -p udp -i $BOARD_IN --dport 67 --sport 68 -j ACCEPT

 ##
 #OUTPUT
 echo "OUTPUT";
 ##
  # OUTPUT local lo
  iptables -A OUTPUT -o $BOARD_LO -j ACCEPT


  # OUTPUT Accept Internet
  iptables -A OUTPUT -m state --state NEW,ESTABLISHED,RELATED -j ACCEPT

 ##
 # FORWARD
 echo "FORWARD";
 ##
  # FORWARD Accept Internet
  iptables -A FORWARD -m state --state NEW,RELATED,ESTABLISHED -j ACCEPT

#
## End Allow Rules


## Start Secure Rules
#

 ## Block TraceRoute

  ## Start Logs
  #

  #
  ## End Logs

#
## End Secure Rules

echo "Firewall Started!";
}

function stoped(){
clear;
echo "Firewall Stop";
iptables -F

echo "Default Rules";
iptables -P INPUT ACCEPT
iptables -P OUTPUT ACCEPT
iptables -P FORWARD ACCEPT

echo "Firewall Stoped!";

}

function stats(){
iptables -L
}


###
#	Body Firewall
###
#
case "$1" in
 start)
  echo "1";
  started;
 ;;
 stop)
  echo "2";
  started;
  stoped;
 ;;
 restart)
  stoped;
  sleep 3;
  started;
 ;;
 status)
 stats;
 ;;
 *)
  echo "Use $0 + { start|stop|restart|status }";
 ;;
esac
#
###
#	End Body Firewall
###
