## !!! Important Message for users upgrading from 3.x versions !!!
If the addon fails to start after upgrading to 4.x with a message like "Failed to start addon" or "Unknown error, see logs" please make a copy of your config settings and remove, reinstall and reconfigure the addon.  This should correct the issue.

## Configuration
***Ring now requires two-factor authentication (2FA) so the username and password options have been removed from this add-on.***
***Please read the instructions below to generate a refresh token.***

With the 4.0 release of this addon, efforts have been made to dramatically simplify configuration.  For many cases no manual settings should be required except to enable optional features as desired.  The addon now attempts to automatically discover required MQTT settings via the Home Assistant services API so, for many cases, no manual MQTT configuration is needed, but they can still be overridden for cases where discovery fails or doesn't work such as setups using an external MQTT broker vs the official Mosquitto addon.

The web based token generator now integrates into Home Assistant via the Ingress functionality providing a more seamless experience and requiring no external ports.

To generate a token, simply open the web UI for the addon (takes 5-10 seconds to start after starting the addon) and follow the instructions in the wizard to enter your Ring username/password and then the 2FA code sent via email/text.  Once you enter your access information the add-on will save the current token and attempt to start the connection to the Ring servers.  You will ***NOT*** need to copy and paste the token to your configuration.  Refresh tokens are only valid for a limited time (typically 60 minutes) so, going forward, the script will acquire and save new refresh tokens to the state file.  You will ***NOT*** see your current refresh token in the configuration and the refresh_token field can remain blank in the add-on UI.

The add-on will ***ALWAYS*** attempt to connect with the most recently saved refresh token first.  If, for some reason, this refresh token doesn't work (changed password on account, which expires the token immediately, or add-on was offline for more than the token expire time, etc.) simply use the web UI to generate a new token.  If you prefer to generate the refresh token via external means (via CLI or some other method) this is still possible, simply configure the "ring_token" option in the configuration and the add-on will try this token as a fallback if the saved token cannot be used or does not exist.

To configure this plugin please review the following options:

| Config Option | Description |
| --- | --- |
| enable_cameras | Default false since the native Ring component for Home Assistant supports these, set to true to use camera support in this add-on |
| snapshot_mode | Enable still snapshot image updates from camera, see [Snapshot Options](#snapshot-options) for details | 'disabled' |
| enable_modes | For locations without a Ring alarm enable a control panel for setting Location Modes instead |
| enable_panic | When set to true, the alarm control panel device will expose two switches for activating panic alarms for police/fire (you can also build automations for police/fire alarms by monitoring these switches)  |
| enable_volume | When set to true, volume control for Keypads and Base Station will be supported.  See [Volume Control](#volume-control) for details. |
| mqtt_host | Manually specify/override auto detected MQTT hostname/IP address |
| mqtt_port | Manually specify/override auto detected MQTT host TCP port |
| mqtt_user | Manually specify/override auto detected MQTT user |
| mqtt_password | Manually specify/override auto detected MQTT password |
| branch | Default value "addon" runs code from local Docker image.  See [Branch Feature](#branch-feature) for details. |
| ring_token | Used only as fallback, should be blank for most cases, please use the Web UI to generate a token |
| location_ids | Comma separated list of location Ids to limit devices.  Blank is all locations which the specified account has access to. |

## Snapshot Options
Since ring-mqtt version 4.3 ring-mqtt has the ability to send still image snapshots.  These images will automatically display in many home automation platforms such as Home Assistant as a camera entity.  Please note that these are not live action as MQTT is limited in this regard, however, even these snapshots can be quite useful.  There are a few modes that can be enabled:

| Mode | Description |
| --- | --- |
| disabled | Snapshot image support will be disabled and not snapshot images are sent via MQTT |
| motion | Snapshot images are refreshed only on detected camera motion events |
| interval | Snapshot images are refreshed via scheduled intervals only |
| all | Snapshots are refreshed on both scheduled and motion events, scheduled snapshots are paused during active motions events |

When snapshot support is enabled, the script always attempts to grab a snapshot on initial startup.

When interval mode is selected, snapshots of cameras with wired power supply are taken every 30 seconds by default, for battery powered cameras taking a snapshot every 30 seconds leads to signifcant power drain so snapshots are taken every 10 minutes, however, if the Ring Snapshot Capture feature is enabled, snapshots are instead taken at the frequency selected in the Ring app for this feature (minimum 5 minutes for battery powered cameras).

It is also possible to manually override the snapshot interval, although the minimum time between snapshots is 10 seconds.  Simply send the value in seconds to the ring/<location_id>/camera/<device_id>/snapshot/interval topic to override the detected default refresh interval.

## Volume Control
Ring shared users do not have access to control the Base Station volume (any user can control Keypad volume) so, to enable control of Base Station volume using this addon, the refresh token must be generated using the primary Ring account. During startup the addon attempts to detect if the account can control the base station volume and only enables the volume control if it determines the account has access. This is a limitation of the Ring API as even the official Ring App does not offer volume control to shared users.

**!!! Important Note about Volume Control in Home Assistant !!!**\
Due to the limitations of available MQTT integration components with Home Assistant, volume control entities will appears as a "light" with brightness function. The brightness control is used to set the volume level while turning the switch off immediately sets the volume to zero and turning the switch on sets the volume to 65%, although you can also turn the volume back on by setting the slider volume to any level other than zero. Overall this works well, you can override icons to make it look reasonable in the Lovelace UI and automations can be used to set device volume based on time-of-day, alarm mode, etc., but this approach can have some unexpected side effects. For example, if you have an automation that turns off all lights when you leave, this automation will likely also silence the volume on the keypad/base station since Home Assistant sees the device as a light. Be aware of these possible behaviors before enabling the volume control feature.  Perhaps in the future a better MQTT component will be available to expose this functionality.

## Branch Feature
The branch feature is designed to make testing the latest code easier for addon users. If you want to test the latest code from the ring-mqtt Github project simply set "latest" or "dev" and, during startup the addon will pull the latest code from the master or dev branch respectively.  To revert to stock code for the addon just simple change the option back to "addon" in the config.  Note that this setting is recommended for testing only as it requires an internet connection to start and the dev branch may not always be in a function state.
