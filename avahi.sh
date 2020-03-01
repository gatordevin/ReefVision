sed -i '/hosts/c\hosts:          files mdns4_minimal [NOTFOUND=return] resolve [!UNAVAIL=return] dns myhostname' /etc/nsswitch.conf
