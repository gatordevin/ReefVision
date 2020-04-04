
rm -rf reef.service
cat <<EOT >> reef.service
[Unit]
Description=systemd auto reef service
After=weston.target

[Service]
PAMName=login
Type=simple
User=mendel
WorkingDirectory=/home/mendel/ReefVision
Environment=DISPLAY=:0
ExecStart=/bin/bash /usr/bin/reef_service.sh
Restart=always

[Install]
WantedBy=multi-user.target
EOT

sudo mv reef.service /lib/systemd/system/reef.service


echo "python3 -m Reef_Vision.detect_server" >> reef_service.sh
sudo chmod u+x reef_service.sh
sudo mv reef_service.sh /usr/bin
sudo systemctl enable reef.service
sudo systemctl start reef.service
