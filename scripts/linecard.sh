#!/bin/bash


if [[ $# -eq 0 ]] ; then
    echo 'No parameters provided. Running in default mode:'
    echo 'linecard.sh [list of linecards to set]'

    #Setting IP
	sudo $SFLAG vppctl -p vpp set int ip address $NAMELC2P1 $IPLC2P1/24
	sudo $SFLAG vppctl -p vpp set int ip address $NAMELC2P2 $IPLC2P2/24

	# Setting ARPs
	sudo $SFLAG vppctl -p vpp set ip arp static $NAMELC2P1 $IPLC1P1 $MACLC1P1

	sudo $SFLAG vppctl -p vpp set interface state $NAMELC2P1 up
	sudo $SFLAG vppctl -p vpp set interface state $NAMELC2P2 up

    exit 1
fi

echo "Configuring Linecards for IP mode"

# Optional: add ip addresses to check ping

# Show for sanity check
#vppctl -p vpp show int address
