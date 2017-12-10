#!/bin/bash

echo "waiting for fhem (15s)"
sleep 15s
echo "Homebridge starting..."

homebridge
echo "Homebridge stopped"