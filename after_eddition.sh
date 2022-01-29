#!/bin/bash

sudo systemctl daemon-reload
sudo systemctl enable wpa_supplicant.service

sudo nano /etc/systemd/system/dhclient.service
sudo echo "[Unit]\nDescription=DHCP Client\nBefore=network.target\nAfter=wpa_supplicant.service\n\n[Service]\nType=forking\nExecStart=/sbin/dhclient wlan0 -v\nExecStop=/sbin/dhclient wlan0 -r\nRestart=always\n\n[Install]\nWantedBy=multi-user.target\n" > /etc/systemd/system/dhclient.service

sudo systemctl enable dhclient.service
