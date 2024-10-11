#!/bin/bash

# NetworkManager expected to be on, wpa_supplicant expected.

# Wifi Interface, find with nmcli device
INTERFACE="wlp3s0"
# Path to wpa_supplicant
WPA_CONF="$HOME/.config/cat_installer/cat_installer.conf"

# Restart Wifi for redundancy
sudo nmcli radio wifi off
sudo nmcli radio wifi on

# Use the supplicant
sudo wpa_supplicant -i $INTERFACE -c $WPA_CONF -B

# NetworkManager does this, but just in case here it is.
#sudo dhclient $INTERFACE


echo "Connected to Eduroam!"
