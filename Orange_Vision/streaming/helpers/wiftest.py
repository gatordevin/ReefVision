from wifi import Cell, Scheme
wifi_list = Cell.all('wlan0')
for connection in wifi_list:
    print(connection.ssid, connection.encrypted)