![ring-mqtt-logo](https://raw.githubusercontent.com/tsightler/ring-mqtt-ha-addon/master/logo.png)

![aarch64-shield](https://img.shields.io/badge/aarch64-yes-green.svg)
![amd64-shield](https://img.shields.io/badge/amd64-yes-green.svg)
![armhf-shield](https://img.shields.io/badge/armhf-yes-green.svg)
![armv7-shield](https://img.shields.io/badge/armv7-yes-green.svg)

# About
This add-on provides users of Home Assistant OS or Home Assistant Supervised an easy method to install and run the [ring-mqtt](https://github.com/tsightler/ring-mqtt) project which allows various devices sold by Ring LLC to integrate easily with Home Assistant via the open MQTT protocol.  The project also supports video streaming by providing an RTSP gateway service that allows any media client supporting the RTSP protocol to connect to a Ring camera livestream or to play back recorded events (Ring Protect subscription required for event recording playback).  Please review the full list of [supported devices and features](https://github.com/tsightler/ring-mqtt/wiki#supported-devices-and-features) for more information on current capabilities.

**!!!! Important note regarding camera support !!!!**    
The ring-mqtt project does not turn Ring cameras into 24x7/continuous streaming CCTV cameras.  Ring cameras are designed to work with Ring cloud servers for on-demand streaming based on detected events (motion/ding) or interactive viewing, even when using ring-mqtt, all streaming still goes through Ring cloud servers and is not local.  Attempting to leverage this project for continuous streaming is not a supported use case and attempts to do so will almost certainly end in disappointment, this includes use with NVR tools like Frigate, Zoneminder or others and there are significant functional side effects to doing so, most notably loss of motion/ding events while streaming (Ring cameras only send alerts when they are not actively streaming/recording).  While you are of course welcome to use this project however you like, questions about use of such tools, or issues opened about these tools, will be locked and deleted.

## Support
If you need help with this addon please use the [discussions section](https://github.com/tsightler/ring-mqtt/discussions) on the main [ring-mqtt project](https://github.com/tsightler/ring-mqtt).

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
