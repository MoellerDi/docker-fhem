#!/bin/bash

echo "waiting for fhem (15s)"
sleep 15s
echo "dbus restarting..."
/etc/init.d/dbus restart
echo "avahi-daemon starting..."
service avahi-daemon start
echo "homebridge starting..."
homebridge
echo "homebridge stopped"