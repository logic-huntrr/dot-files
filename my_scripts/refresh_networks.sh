#for conn in $(nmcli -g UUID connection); do nmcli connection delete uuid "$conn"; done
for conn in $(nmcli -g NAME connection); do
    if [[ "$conn" == *"ISM-Campus-Wi-Fi"* || "$conn" == *"br"* ]]; then
        nmcli connection delete "$conn"
    fi
done

nmcli connection delete docker0
nmcli connection delete lo

nmcli dev wifi connect "ISM-Campus-Wi-Fi"
if ! wget --spider --quiet http://google.com; then
	brave --class=rofi-search-browser --user-data-dir=$HOME/.config/BraveSoftware/Rofi-Search --new-window "https://wifilogin.iitism.ac.in/status"
fi

#sudo mv /etc/NetworkManager/system-connections /etc/NetworkManager/system-connections.bak
#sudo mkdir /etc/NetworkManager/system-connections
#sudo chmod 700 /etc/NetworkManager/system-connections
#sudo rm /var/lib/NetworkManager/*
