#!/bin/bash

# UPS Check script
# Lance Nickel, 2021


#### CONFIGURATION ##########################################
#    Update these variables with the correct information.   #
#    UPS=       Name of UPS on the NUT server to check.     #
#    SERVER=    Hostname/IP address of NUT server.          #
                                                            #
UPS=
SERVER=
                                                            #
#############################################################



LOGUPS=/var/log/upscheck.log
SHUTDOWN=false



# initial check



if [[ $(upsc $UPS@$SERVER | grep ups.status: | cut -d ":" -f2 | cut -d " " -f2) == 'OB' ]]; then
	echo 'on batt'
elif [[ $(upsc $UPS@$SERVER | grep ups.status: | cut -d ":" -f2 | cut -d " " -f2) == 'OL' ]]; then
        echo 'on line'
	exit
else
	echo 'error'
        exit
fi



sleep 60 # 1 minute



if [[ $(upsc $UPS@$SERVER | grep ups.status: | cut -d ":" -f2 | cut -d " " -f2) == 'OB' ]]; then
	echo 'on batt'
elif [[ $(upsc $UPS@$SERVER | grep ups.status: | cut -d ":" -f2 | cut -d " " -f2) == 'OL' ]]; then
        echo 'on line'
	exit
else
        echo 'error'
	exit
fi



sleep 60 # 2 minutes



if [[ $(upsc $UPS@$SERVER | grep ups.status: | cut -d ":" -f2 | cut -d " " -f2) == 'OB' ]]; then
	echo 'on batt'
elif [[ $(upsc $UPS@$SERVER | grep ups.status: | cut -d ":" -f2 | cut -d " " -f2) == 'OL' ]]; then
        echo 'on line'
	exit
else
        echo 'error'
	exit
fi



sleep 60 # 3 minutes



if [[ $(upsc $UPS@$SERVER | grep ups.status: | cut -d ":" -f2 | cut -d " " -f2) == 'OB' ]]; then
	echo 'on batt'
elif [[ $(upsc $UPS@$SERVER | grep ups.status: | cut -d ":" -f2 | cut -d " " -f2) == 'OL' ]]; then
        echo 'on line'
	exit
else
        echo 'error'
	exit
fi



sleep 60 # 4 minutes



if [[ $(upsc $UPS@$SERVER | grep ups.status: | cut -d ":" -f2 | cut -d " " -f2) == 'OB' ]]; then
	echo 'on batt'
elif [[ $(upsc $UPS@$SERVER | grep ups.status: | cut -d ":" -f2 | cut -d " " -f2) == 'OL' ]]; then
        echo 'on line'
	exit
else
        echo 'error'
	exit
fi



sleep 60 # 5 minutes, SHUTDOWN!



if [[ $(upsc $UPS@$SERVER | grep ups.status: | cut -d ":" -f2 | cut -d " " -f2) == 'OB' ]]; then
	echo 'shutdown'
	SHUTDOWN=true
elif [[ $(upsc $UPS@$SERVER | grep ups.status: | cut -d ":" -f2 | cut -d " " -f2) == 'OL' ]]; then
        echo 'on line'
	exit
else
        echo 'error'
	exit
fi



if [ $SHUTDOWN = true ]; then
	/sbin/shutdown now
fi

