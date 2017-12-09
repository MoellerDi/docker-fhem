#!/bin/bash
set -e
cd /opt/fhem
echo "Starte FHEM"
exec perl fhem.pl $1 | tee /opt/fhem/log/fhem.log
echo "FHEM stopped"