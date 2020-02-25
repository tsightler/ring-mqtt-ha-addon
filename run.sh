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
echo "-------------------------------------------------------"
cd ring-mqtt
echo "Running \"npm install\" to install dependent packages..."
npm install
echo "Running \"npm audit fix\" to update packages with any vulnerabilities..."
npm audit fix
chmod +x ring-mqtt.js
echo "-------------------------------------------------------"
echo Running ring-mqtt.js version $(cat package.json | grep version | cut -f4 -d'"')...
DEBUG=ring-mqtt HASSADDON=true /ring-mqtt/ring-mqtt.js
