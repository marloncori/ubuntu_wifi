#!/bin/bash

wpa_passphrase "TP-Link_950F" "11070368" | sudo tee /etc/wpa_supplicant.conf

sudo wpa_supplicant -B -c /etc/wpa_supplicant.conf -i wlan0

sudo systemctl stop NetworkManager

sudo systemctl disable NetworkManager-wait-online NetworkManager-dispatcher NetworkManager

sudo dhclient wlan0

sudo cp /lib/systemd/system/wpa_supplicant.service /etc/systemd/system/wpa_supplicant.service

sudo nano /etc/systemd/system/wpa_supplicant.service
