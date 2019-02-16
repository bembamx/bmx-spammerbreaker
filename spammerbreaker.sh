#!/bin/bash
#Script made by Tony Cardenas tony@bemba.mx
#2019 - Feb
#wwww.bemba.mx

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

ECONF="/etc/exim.conf"

SL="$(sed -n 's/hostlist spammeripblocks = net-iplsearch;//p' $ECONF)"

if [ -e "$SL" ] ; then 
	
	if [ $1 ] && [ $2 ]; then
		if [[ $2 =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
			case $1 in
				"rm" )
					sed -i "/$2/d" $SL
					if grep -Fxq "$2" $SL ; then
						echo "IP could not be removed"
					else 
						echo "IP successfully removed"
					fi
					;;
			
				"add" )
					echo "$2" >> $SL
					if grep -Fxq "$2" $SL ; then
						echo "IP successfully added"
					else 
						echo "IP could not be added"
					fi
					;;
				
				*)
					echo "Coud not understand your arguments"
				;;
			esac
		else 
			echo "Second argument is not an IP"
		fi
	else 
	
		if [ $1 == "restart" ]; then
			sh /scripts/restartsrv_exim
		else 	
			echo "No arguments passed, please pass [command] [IP]"
		fi
	fi
fi