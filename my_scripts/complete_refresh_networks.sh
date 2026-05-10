for conn in $(nmcli -g UUID connection); do nmcli connection delete uuid "$conn"; done

echo "asdf" | sudo -S systemctl stop NetworkManager
sudo rm -rf /etc/NetworkManager/system-connections.bak
sudo mv /etc/NetworkManager/system-connections /etc/NetworkManager/system-connections.bak
sudo mkdir /etc/NetworkManager/system-connections
sudo chmod 700 /etc/NetworkManager/system-connections
sudo rm /var/lib/NetworkManager/*
sudo systemctl start NetworkManager

while ! nmcli general status >/dev/null 2>&1; do
    sleep 0.5
done
sleep 2
nmcli dev wifi connect "ISM-Campus-Wi-Fi"
sleep 0.5
if ! wget --spider --quiet http://google.com; then
	brave --class=rofi-search-browser --user-data-dir=$HOME/.config/BraveSoftware/Rofi-Search --new-window "https://wifilogin.iitism.ac.in/status"
fi
