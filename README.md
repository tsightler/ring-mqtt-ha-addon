# Ring Devices via MQTT Add-on for Home Assistant
## !!! Important Message for users upgrading from 3.x versions !!!
If the addon fails to start after upgrading to 4.x with a message like "Failed to start addon" or "Unknown error, see logs" please make a copy of your config settings and remove, reinstall and reconfigure the addon.  This should correct the issue.

## Overview
This Home Assistant add-on provides integration of Ring devices using the [ring-mqtt](https://github.com/tsightler/ring-mqtt) script.  Currently most alarm and smart lighting devices are supported as well as camera functions and some 3rd party sensors and switches.  Camera support is disabled by default since these are supported via the native Ring component in Home Assistant, but can be enabled if you prefer to use the support here.

***This add-on requires a working MQTT broker.  The Mosquitto MQTT add-on for Home Assistant is highly recommended.***
