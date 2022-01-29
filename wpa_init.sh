#!/bin/bash

sudo wpa_supplicant -B -c /etc/wpa_supplicant.conf -i wlan0

sudo dhclient wlan0
