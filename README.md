![ring-mqtt-logo](https://raw.githubusercontent.com/tsightler/ring-mqtt-ha-addon/master/logo.png)

![aarch64-shield](https://img.shields.io/badge/aarch64-yes-green.svg)
![amd64-shield](https://img.shields.io/badge/amd64-yes-green.svg)
![armhf-shield](https://img.shields.io/badge/armhf-yes-green.svg)
![armv7-shield](https://img.shields.io/badge/armv7-yes-green.svg)

**!!!! Important Note - Please Read !!!!**  
Due to the fact that I'm feeling extremely burnt out with this project, as of Oct 2021, I've decided to step away from it for at least a few months.  After the New Year I'll re-evaluate and determine if I want to pick it back up again.  Of course anyone is still welcome to use the project as-is but, for now, I've disabled the issues tab and will not be accepting support, bug, or feature requests nor monitoring any forums.

# About
This Home Assistant add-on uses the [ring-mqtt](https://github.com/tsightler/ring-mqtt) script to integrate alarm, smart lighting and camera devices sold by Ring LLC into Home Assistant via the MQTT protocol. Currently, most official Ring alarm devices, as well as many 3rd party Z-wave devices that can be connected to the Ring Alarm hub, are supported.  Support for camera and chime devices is disabled by default since these devices are already supported via the native Home Assistant Ring component, but is enabled if using the integration from this addon is preferred.

The optional camera support includes the ability to stream both live and recorded events (streaming recorded events requires a Ring Protect Plan subscription) and includes the required metadata needed to automate downloading recorded videos.  The automatically discovered cameras use the Home Assistant MQTT camera component and these cameras only support snapshots so using the video streaming support will require manually adding generic IP cameras to the Home Assistant configuration.yaml file.  Please read the documentation for more details on configuring the streaming cameras.

## Quick Install  
This is a Home Assistant addon and must be added to the native Home Assistant add-on store, this project has nothing to do with HACS and attempts to add this to HACS will fail.  The Home Assistant add-on store is only available when running Home Assistant Supervised installed via either Home Assistant OS or manually.  If you are running Home Assistant Core via Docker or manual install into a Python virtual environment then there is no support for the addon store but you can still run the [ring-mqtt](https://github.com/tsightler/ring-mqtt) project directly to get the same capabilities.

**This add-on requires a working MQTT broker.  Configuring Home Assistant MQTT support is outside of the scope of this document but the standard Home Assistant Mosquitto integration along with the Mosquitto MQTT add-on is the recommended configuration.**

To install this addon follow these steps:

1) Navigate to the add-on store in the Home Assistant UI (**Supervisor** in the left menu, then **Add-on Store** on the top tab)
2) Select the three vertical dots in the upper right-hand corner and select repositories
3) In the **Manage add-on repositories** screen enter the URL for this projects Github page (https://github.com/tsightler/ring-mqtt-ha-addon) and click add
4) After adding the repository scroll to the bottom of the list of addons or use seach to find the addon
5) Select the addon and click the **Install**
6) Proceed to the [configuration documentation](DOCS.md)
