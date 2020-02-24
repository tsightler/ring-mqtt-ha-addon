#!/bin/bash
echo "-------------------------------------------------------"
echo "| Ring Device Integration via MQTT                    |"
echo "| Addon for Hass.io                                   |"
echo "|                                                     |"
echo "| Report issues at:                                   |"
echo "| https://github.com/tsightler/ring-mqtt-hassio-addon |"
echo "-------------------------------------------------------"
echo Node version $(node -v)
echo NPM version $(npm -v)
git --version
echo
cd ring-mqtt
if [ ! -d "node_modules" ]; then
    echo "Installing dependent packages..."
    npm install
fi
echo "Checking for security issues in dependent packages..."
npm audit fix
chmod +x ring-mqtt.js
echo Running ring-mqtt.js version $(cat package.json | grep version | cut -f4 -d'"')...
DEBUG=ring-mqtt HASSADDON=true /ring-mqtt/ring-mqtt.js
