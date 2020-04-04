#!/bin/sh
if [ $(bluetoothctl show | grep "Powered: yes" | wc -c) -eq 0 ]; then
	echo "%{F#66ffffff}"
else
	if [ $(echo info | bluetoothctl | grep 'Device' | wc -c) -eq 0 ]; then 
		echo ""
	else
		fullname=$(echo $(echo info | bluetoothctl | grep 'Name'))
		name=${fullname#"Name: "}
		echo "%{F#2193ff} $name"
	fi
fi 