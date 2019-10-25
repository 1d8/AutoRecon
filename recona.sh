#!/bin/bash

#getting colors for pretty recona
CYAN='\033[1;36m'
NC='\033[0m'
RED='\033[0;31m'
PURP='\033[0;35m'
LPURP='\033[1;35m'
BLK='\033[0;30m'


echo -e ${BLK}"-------------------------------------------------------------------------"${NC}

#options for user

echo -e ${LPURP}"      :::::::::  :::::::::: ::::::::   ::::::::  ::::    :::     :::  
     :+:    :+: :+:       :+:    :+: :+:    :+: :+:+:   :+:   :+: :+: 
    +:+    +:+ +:+       +:+        +:+    +:+ :+:+:+  +:+  +:+   +:+ 
   +#++:++#:  +#++:++#  +#+        +#+    +:+ +#+ +:+ +#+ +#++:++#++: 
  +#+    +#+ +#+       +#+        +#+    +#+ +#+  +#+#+# +#+     +#+  
 #+#    #+# #+#       #+#    #+# #+#    #+# #+#   #+#+# #+#     #+#   
###    ### ########## ########   ########  ###    #### ###     ###${NC}
"


echo "
[0] - Nmap Advanced Scan
[1] - The Harvester grab
[2] - Gobuster URL BruteForce
[3] - IP, MAC Address Change
[4] - Simple Ping
[5] - DNS record pull
[6] - Start a listener
"

echo -e ${BLK}"-------------------------------------------------------------------------"${NC}

#used to keep the loop going of asking for user input
x=1
while [ $x -le 2 ]
do

	echo -e ${RED}"To continue, select an option. To exit, type 99."${NC}
	echo -e ${BLK}"******************************************************************************************"${NC}
	
	
	read userchoice

	if [ $userchoice -eq '0' ] ; then
		echo "Enter Target: "
		read target
		nmap -A -T4 -p- $target &
	elif [ $userchoice -eq '1' ]
	then
		echo "Enter Target Domain:"
		read targetd
		theharvester -d $targetd -l 500 -b google &
	elif [ $userchoice -eq '2' ] 
	then
		echo "Enter Target: "
		read gtarget
		gobuster dns -d $gtarget -w /usr/share/dirb/wordlists/big.txt &
	elif [ $userchoice -eq '3' ]
	then
		ifconfig eth0 9.100.100.100
		netmask 0.1.1.0
		ifconfig eth0 down
		ifconfig eth0 hw ether 00:00:00:00:00:02
		ifconfig eth0 up
	elif [ $userchoice -eq '4' ]
	then
		echo "Enter target to check pulse:"
		read pingtarget
		ping $pingtarget -c 3
	elif [ $userchoice -eq '5' ]
	then 
		echo "Enter target: "
		read digtarget
		dig $digtarget
	elif [ $userchoice -eq '6' ]
	then
		echo "Enter port: "
		read port
		netcat -lvnp $port
	else
		echo -e ${RED}"▁ ▂ ▄ ▅ ▆ ▇ █ EXITING...  █ ▇ ▆ ▅ ▄ ▂ ▁"${NC}
		exit

fi
done
