# Ring Devices via MQTT Add-on for Home Assistant
![Supports aarch64 Architecture][aarch64-shield] ![Supports amd64 Architecture][amd64-shield] ![Supports armhf Architecture][armhf-shield] ![Supports armv7 Architecture][armv7-shield] ![Supports i386 Architecture][i386-shield]
## !!! Important Message for users upgrading from 3.x versions !!!
If the addon fails to start after upgrading to 4.x with a message like "Failed to start addon" or "Unknown error, see logs" please make a copy of your config settings and remove, reinstall and reconfigure the addon.  This should correct the issue.

# About
This Home Assistant add-on provides integration of Ring devices using the [ring-mqtt](https://github.com/tsightler/ring-mqtt) script.  Currently most alarm and smart lighting devices are supported as well as camera functions and some 3rd party sensors and switches.  Camera support is disabled by default since these are supported via the native Ring component in Home Assistant, but can be enabled if you prefer to use the support here.

***This add-on requires a working MQTT broker.  The Mosquitto MQTT add-on for Home Assistant is highly recommended.***

[aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg
[amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg
[armhf-shield]: https://img.shields.io/badge/armhf-yes-green.svg
[armv7-shield]: https://img.shields.io/badge/armv7-yes-green.svg
[i386-shield]: https://img.shields.io/badge/i386-yes-green.svg
