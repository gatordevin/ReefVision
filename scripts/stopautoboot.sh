sudo systemctl stop reef.service
sudo pkill -9 -f reef_detect_server
systemctl disable reef.service
rm /lib/systemd/system/reef.service
sudo systemctl daemon-reload
sudo systemctl reset-failed