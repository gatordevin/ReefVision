sudo systemctl stop orange.service
sudo pkill -9 -f orange_detect_server
systemctl disable orange.service
rm /lib/systemd/system/orange.service
sudo systemctl daemon-reload
sudo systemctl reset-failed