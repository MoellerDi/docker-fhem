#!/bin/bash

echo "starting but let's waiting for fhem (15s)"
sleep 15s
echo "service dbus restarting..."
service dbus restart
echo "service avahi-daemon starting..."
service avahi-daemon start
echo "homebridge starting..."
homebridge
echo "homebridge stopped"