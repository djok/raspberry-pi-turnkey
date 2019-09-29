#!/bin/bash

sleep 3

# enable the AP
sudo echo 'interface=wlan0
driver=nl80211
ssid=setup-printer
hw_mode=g
channel=7
wmm_enabled=0
macaddr_acl=0
auth_algs=1
ignore_broadcast_ssid=0
wpa=2
wpa_passphrase=setup-printer
wpa_key_mgmt=WPA-PSK
wpa_pairwise=TKIP
rsn_pairwise=CCMP' > /etc/hostapd/hostapd.conf

sudo echo 'DAEMON_CONF="/etc/hostapd/hostapd.conf"' > /etc/default/hostapd

sudo cp config/hostapd /etc/default/hostapd
sudo cp config/dhcpcd.conf /etc/dhcpcd.conf
sudo cp config/dnsmasq.conf /etc/dnsmasq.conf

# load wan configuration
sudo cp wpa.conf /etc/wpa_supplicant/wpa_supplicant.conf

sudo reboot now
