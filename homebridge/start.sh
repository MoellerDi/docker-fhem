#!/bin/bash

echo "waiting for fhem (15s)"
sleep 15s
echo "Homebridge starting..."

/etc/init.d/dbus restart
service avahi-daemon start
homebridge
echo "Homebridge stopped"