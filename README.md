# Ring MQTT Hass.io Addon
This addon provides integration of Ring devices into Hass.io using the [ring-mqtt](https://github.com/tsightler/ring-mqtt) script.  Currently most alarm devices are supported, as well as camera functions.  Camera support is disabled by default since these are supported via native Ring component in Home Assistant, but can be enabled if you prefer to use the support here.

### Configuration

***This add-on requires an MQTT broker.  The Mosquitto plugin for Hass.io is highly recommended.***

To configure this plugin please review the following options:

| Config Option | Description |
| --- | --- |
| host | This plugin is configured to run on the host network so localhost should be fine if running Mosquitto on the Hass.io server |
| port | MQTT broker port, default is 1883, rarely needs to be changed |
| ring_topic | Top level MQTT topic where ring devices will be published.  Should rarely be changed.  |
| hass_topic | The default Hass.io availability topic, used to monitor for Hass.io restarts to republish device state.  Should rarely be changed. |
| mqtt_user | Username for MQTT broker (default for Mosquitto addon is to use HA username/password) |
| mqtt_pass | Password for MQTT broker (default for Mosquitto addon is to use HA username/password) |
| ring_token | The refresh token received after authenticating with 2FA - See https://github.com/dgreif/ring/wiki/Two-Factor-Auth |
| enable_cameras | Default false since the native Ring component for Home Assistant supports these, set to true to use camera support in this addon |
| location_ids | Comma separated list of location Ids to limit devices.  Blank is all locations which the specified account has access to. |

