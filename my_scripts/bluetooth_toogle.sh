#!/bin/bash
# Check Bluetooth power status
status=$(bluetoothctl show | grep "Powered" | awk '{print $2}')
if [ "$status" = "yes" ]; then
	bluetoothctl power off
else
	bluetoothctl power on
fi   
