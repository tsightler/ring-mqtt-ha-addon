# Ring Devices via MQTT Add-on for Home Assistant
This Home Assistant add-on provides integration of Ring devices using the [ring-mqtt](https://github.com/tsightler/ring-mqtt) script.  Currently most alarm and smart lighting devices are supported as well as camera functions and some 3rd party sensors and switches.  Camera support is disabled by default since these are supported via native Ring component in Home Assistant, but can be enabled if you prefer to use the support here.

***This add-on requires a working MQTT broker.  The Mosquitto add-on for Home Assistant is highly recommended, but any MQTT compliant broker should work.***

### Configuration
***Ring now requires two-factor authentication (2FA) so the username and password options have been removed from this add-on.***
***Please read the instructions below to generate a refresh token.***

While there are mulitple methods to generate a refresh token, to simplify the creation of the token, this add-on includes a small web service.  To activate this service simply leave the "refresh_token" field blank, start the add-on and give it a few seconds (it normally takes 5-10 seconds to start the web service and you should see the message "Go to http://<host_ip_address>:55123/ to generate a valid token." in the add-on logs).  Once the servers has started simply click the "Open Web UI" link to start the wizard or you can manually go the the URL from any browser on your network.

Follow the instructions in the wizard to enter your username/password and the 2FA code sent via email/text.  Once you enter your access information the add-on will save the current token and attempt to start the connection to the Ring servers.  You will ***NOT*** need to copy and paste the token to your configuration.  Refresh tokens are only valid for a limited time (typically 60 minutes) so, going forward, the script will acquire and save new refresh tokens to the state file.  You will ***NOT*** see your current refresh token in the configuraiton and the refresh_token field can remain blank in the add-on UI.

The add-on will ***ALWAYS*** attempt to connect with the most recently saved refresh token first.  If, for some reason, this refresh token doesn't work (changed password on account, which exires the token immediately, or add-on was offline for more than and hour, etc) the script will attempt to connect and, if it fails, start the web service again to allow you to generate a new token.  If you prefer the generate the token via external means (via CLI or some other method) you can still configure the "ring_token" parameter in the configuration and the add-on will try this token as a fallback if the saved token cannot be used or does not exist.

For security purposes the webserver runs only if the ring_token option is blank so it's not reachable under normal operation, although the "OPEN WEB UI" option will still be in the add-on UI it will not function.

To configure this plugin please review the following options:

| Config Option | Description |
| --- | --- |
| host | This plugin is configured to run on the host network so localhost should be fine if running Mosquitto on the Hass.io server |
| port | MQTT broker port, default is 1883, rarely needs to be changed |
| ring_topic | Top level MQTT topic where ring devices will be published.  Should rarely be changed.  |
| hass_topic | The default Hass.io availability topic, used to monitor for Hass.io restarts to republish device state.  Should rarely be changed. |
| mqtt_user | Username for MQTT broker (default for Mosquitto addon is to use HA username/password) |
| mqtt_pass | Password for MQTT broker (default for Mosquitto addon is to use HA username/password) |
| ring_token | A manually configured refresh token. This can remain blank if you use the built in web UI to generate a token or you can follow the instructions at https://github.com/dgreif/ring/wiki/Refresh-Tokens to manually create a token and enter it here |
| enable_cameras | Default false since the native Ring component for Home Assistant supports these, set to true to use camera support in this addon |
| enable_modes | Enable support for Location Modes for sites without a Ring Alarm Panel
| location_ids | Comma separated list of location Ids to limit devices.  Blank is all locations which the specified account has access to. |

