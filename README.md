# Ring Devices via MQTT Add-on for Home Assistant
This Home Assistant add-on provides integration of Ring devices using the [ring-mqtt](https://github.com/tsightler/ring-mqtt) script.  Currently most alarm and smart lighting devices are supported as well as camera functions and some 3rd party sensors and switches.  Camera support is disabled by default since these are supported via the native Ring component in Home Assistant, but can be enabled if you prefer to use the support here.

***This add-on requires a working MQTT broker.  The Mosquitto MQTT add-on for Home Assistant is highly recommended.  Please remember to also enable to MQTT integration component in the Home Assistant UI or configuraiton.yaml.  For more details see the Home Assistant documentation.***

