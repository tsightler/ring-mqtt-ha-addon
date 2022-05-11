![ring-mqtt-logo](https://raw.githubusercontent.com/tsightler/ring-mqtt-ha-addon/master/logo.png)

![aarch64-shield](https://img.shields.io/badge/aarch64-yes-green.svg)
![amd64-shield](https://img.shields.io/badge/amd64-yes-green.svg)
![armhf-shield](https://img.shields.io/badge/armhf-yes-green.svg)
![armv7-shield](https://img.shields.io/badge/armv7-yes-green.svg)

# About
This Home Assistant add-on provides an easy method to install the [ring-mqtt](https://github.com/tsightler/ring-mqtt) project for users of Home Assistant OS, providing a bridge between alarm, smart lighting and camera devices sold by Ring LLC and Home Assistant using the Home Assistant MQTT integration and device support.  The project also supports video streaming by providing an RTSP gateway service that allows any media client supporting the RTSP protocol to connect to a Ring camera livestream or to play back recorded events (Ring Protect subscription required for event recording playback).  Please review the full list of [supported devices and features](https://github.com/tsightler/ring-mqtt/wiki#supported-devices-and-features) for more information on current capabilities.

## Quick Install
This is a Home Assistant addon and must be added to the native Home Assistant add-on store, this project has nothing to do with HACS and attempts to add this repository to HACS will fail.  The Home Assistant add-on store is only available when running Home Assistant Supervised installed via either Home Assistant OS or manually.  If you are running Home Assistant Core via Docker or manual install into a Python virtual environment then there is no support for the addon store but you can still run the [ring-mqtt](https://github.com/tsightler/ring-mqtt) project directly to get the same capabilities.

**This add-on requires a working MQTT broker.  Configuring Home Assistant MQTT support is outside of the scope of this document but the standard Home Assistant Mosquitto integration along with the Mosquitto MQTT add-on is the recommended configuration.**

To install this addon follow these steps:

1) Navigate to the add-on store in the Home Assistant UI (**Supervisor** in the left menu, then **Add-on Store** on the top tab)
2) Select the three vertical dots in the upper right-hand corner and select repositories
3) In the **Manage add-on repositories** screen enter the URL for this projects Github page (https://github.com/tsightler/ring-mqtt-ha-addon) and click add
4) After adding the repository scroll to the bottom of the list of addons or use seach to find the addon
5) Select the addon and click the **Install**
6) Proceed to the [configuration documentation](DOCS.md)

Please refer to the [ring-mqtt project wiki](https://github.com/tsightler/ring-mqtt/wiki) for complete documentation on the various features and configuration options.