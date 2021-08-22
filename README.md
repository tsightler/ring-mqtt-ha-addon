![ring-mqtt-logo](https://github.com/tsightler/ring-mqtt-ha-addon/blob/f1b9eab5e5b5a12c08de1df0b6e90ec60c3fd2ca/logo.png)

![aarch64-shield](https://img.shields.io/badge/aarch64-yes-green.svg)
![amd64-shield](https://img.shields.io/badge/amd64-yes-green.svg)
![armhf-shield](https://img.shields.io/badge/armhf-yes-green.svg)
![armv7-shield](https://img.shields.io/badge/armv7-yes-green.svg)
# About
This Home Assistant add-on provides integration of Ring devices using the [ring-mqtt](https://github.com/tsightler/ring-mqtt) script.  Currently, most official Ring alarm devices, as well as many 3rd party Z-wave devices that can be connected to the Ring Alarm hub, are supported.  The addon also support Ring Smart Lighting, Cameras and Chimes.  Camera and Chime support is disabled by default since these are already supported via the native Home Assistant Ring component, but can be easily enabled if you prefer to use the support available in this addon instead.  Please note that, because this addon uses MQTT, camera support does **NOT** include live video, only snapshots are sent via MQTT on motion events or using a scheduled interval (or both).  It is also possible to use both the native Ring component and the camera/chime support in this addon at the same time to combine the capabilities.

***This add-on requires a working MQTT broker.  The Mosquitto MQTT add-on for Home Assistant is highly recommended.***
