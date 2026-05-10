#!/bin/bash
if ip a show proton0 &>/dev/null; then
	protonvpn disconnect
	notify-send "VPN Conneced"
else
	protonvpn connect
	notify-send "VPN Disconnected"   
fi
