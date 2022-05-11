## Detailed Configuration
Please refer to the [ring-mqtt project wiki](https://github.com/tsightler/ring-mqtt/wiki) for detailed documentation on this project.

## Global Configuration Options
| Config Option | Description | Default |
| --- | --- | --- |
| mqtt_url | URL for connecting to MQTT server.  Example with TLS encryption and username/password authentication: mqtts://user:password@my-mqtt-host:8883 | mqtt://auto_username:auto_password@auto_hostname:1883 |
| mqtt_options | Comma separated list of options that will be passed to MQTT.js client library.  Mostly useful for self-signed certificates or client side certificate authentication. See [MQTT Advanced Options](https://github.com/tsightler/ring-mqtt/wiki/MQTT-Advanced-Options) for more details. | blank |
| livestream_user | Specify a password for RTSP connections.  Highly recommended if the RTSP port for external media player access is enabled.  The livestream_password option must also be defined or this option is ignored. | blank |
| livestream_pass | Specify a password for RTSP connections.  Highly recommended if the RTSP port for external media player access is enabled.  The livestream_user option must also be defined or this option is ignored. | blank |
| disarm_code | Used only with Home Assistant, when defined this option causes the Home Assistant Alarm Control Panel integration to require entering this code to disarm the alarm | blank |
| enable_cameras | Default false since the native Ring component for Home Assistant supports cameras, set to true to enable camera/chime support in this add-on.  Access to Chimes cannot be granted to shared users so Chime support requires use of the primary Ring account. | true |
| enable_modes | Enable support for Location Modes for sites without a Ring Alarm Panel | false |
| enable_panic | Enable panic buttons on Alarm Control Panel device | false |
| hass_topic | The topic to monitor for Home Assistant restarts (MQTT birth/last will messages) | homeassistant/status |
| ring_topic | The top level topic for all device state and command topics | ring |
| location_ids | Array of location Ids in format: ["loc-id", "loc-id2"], see [Limiting Locations](#limiting-locations) for details | blank |