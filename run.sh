#!/bin/bash
echo Ring Device Integration via MQTT
echo Node Version
node -v
echo NPM Version
npm -v
git --version

cd ring-mqtt
npm install
npm audit fix
chmod +x ring-mqtt.js
DEBUG=ring-mqtt HASSADDON=true /ring-mqtt/ring-mqtt.js
