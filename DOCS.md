## Configuration
This addon supports simple configuration that, for many cases, requires no manual settings other than enabling any optional features in the configuration.  The addon automatically discovers required MQTT settings via the Home Assistant services API but, in cases where auto detection isn't possible, all options can still be manually configured.

To generate the initial authentication token simply start the addon, give the system 5-10 seconds to initialize, then click the button to open the web UI and follow the instructions in the wizard to enter your Ring username/password and then the 2FA code sent via email/text.  Once you enter your access information the add-on will retrieve a token, save it to the filesystem, and attempt to start the connection to the Ring servers.  Refresh tokens are only valid for a limited time (typically a few hours to a few days) so, going forward, the addon will refresh and save new tokens to the state file.  The refresh token will not be displayed in the UI and the refresh_token field can remain blank in the addon configuration UI.

The add-on will ***ALWAYS*** attempt to connect with the most recently stored refresh token first.  If, for some reason, this refresh token doesn't work (changed password on account, which expires the token immediately, or the addon was offline for more than the token expire time, etc.) simply use the web UI to generate a new token.  If you prefer to generate the refresh token via external means (via CLI or some other method) this is possible, simply generate the token via your preferred method and then paste the token into the "ring_token" option in the configuration.  On startup the add-on will try this token as a fallback if the saved token cannot be used or does not exist.

To configure this plugin please review the following options:

| Config Option | Description |
| --- | --- |
| enable_cameras | Default false since the native Ring component for Home Assistant supports cameras, set to true to enable camera/chime support in this add-on.  Access to Chimes cannot be granted to shared users so Chime support requires use of the primary Ring account. |
| snapshot_mode | Enable still snapshot image updates from camera, see [Snapshot Options](#snapshot-options) for details | 'disabled' |
| livestream_user | Specifiy a password for RTSP connections.  Highly recommended if the RTSP port for external media player access is enabled.  The livestream_password option must also be defined or this option is ignored. |
| livestream_pass | Specifiy a password for RTSP connections.  Highly recommended if the RTSP port for external media player access is enabled.  The livestream_user option must also be defined or this option is ignored. |
| enable_modes | For locations without a Ring alarm enable a control panel for setting Location Modes instead |
| enable_panic | When set to true, the alarm control panel device will expose two switches for activating panic alarms for police/fire (you can also build automations for police/fire alarms by monitoring these switches)  |
| beam_duration | Set a default duration in seconds for Ring Smart Lighting when turned on via this integration.  The default value of 0 will attempt to detect the last used duration or default to 60 seconds for light groups.  This value can be overridden for individual lights using the duration feature but must be set before the light is turned on. | 0 |
| disarm_code | Used only with Home Assistant, when defined this option causes the Home Assistant Alarm Control Panel integration to require entering this code to disarm the alarm | blank |
| mqtt_host | Manually specify/override auto detected MQTT hostname/IP address |
| mqtt_port | Manually specify/override auto detected MQTT host TCP port |
| mqtt_user | Manually specify/override auto detected MQTT user |
| mqtt_pass | Manually specify/override auto detected MQTT password |
| branch | Default value "addon" runs code from local Docker image.  See [Branch Feature](#branch-feature) for details. |
| ring_token | Used only as fallback, should be blank for most cases, please use the Web UI to generate a token |
| location_ids | Comma separated list of location Ids to limit devices.  Blank is all locations which the specified account has access to. |

### Camera video streaming support
Please read the detailed [camera documentation](https://github.com/tsightler/ring-mqtt/blob/main/docs/CAMERAS.md) for more information on configuring video streaming support.

#### External RTSP Server Access
When using the camera support for video streams the addon will run a local instance of rtsp-simple-server.  Since the addon runs on the same host as Home Assistant the Home Assistant instance can access this RTSP server directly via the internal Docker network, however, if you want to access the stream from other host on the network you can expose the RTSP port as well. Note that, if you choose to expose the port, it is HIGHLY recommended to set a live stream user and password using the appropriate configuration options.  Also, the RTSP streams do not currenty support encryption, so direct access to the stream is not recommened over any untrusted network with a VPN.

To export the RTSP port externally simply edit the port settings in the addon configuration tab.  By default the port is disabled and the internal RTSP server listens on TCP port 8554, but it can be exposed externally on the same port or via any other available TCP port.  Once exposed it is possible to connect to the videos streams using any media client that supports RTSP.

## Snapshot Options
This addon has the ability to send still image snapshots via MQTT.  These images will automatically display in many home automation platforms such as Home Assistant as a camera entity.  Please note that these are not live action as MQTT is limited in this regard, however, even these snapshots can be quite useful.  There are a few modes that can be enabled:

| Mode | Description |
| --- | --- |
| disabled | Snapshot image support will be disabled and not snapshot images are sent via MQTT |
| motion | Snapshot images are refreshed only on detected camera motion events |
| interval | Snapshot images are refreshed via scheduled intervals only |
| all | Snapshots are refreshed on both scheduled and motion events, scheduled snapshots are paused during active motions events |

When snapshot support is enabled, the script always attempts to grab a snapshot on initial startup.

When interval mode is selected, snapshots of cameras with wired power supply are taken every 30 seconds by default, for battery powered cameras taking a snapshot every 30 seconds leads to signifcant power drain so snapshots are taken only every 10 minutes, however, if the Ring Snapshot Capture feature is enabled, snapshots are instead taken at the frequency selected in the Ring app for this feature (minimum 5 minutes for battery powered cameras).

It is also possible to manually override the snapshot interval, with the minimum valid time between snapshots being 10 seconds.  To change the snapshot interval use the snapshot interval entity available on the device in Home Assistant.

## Arming Bypass
By default, attempts to arm the alarm when any contact sensors are in faulted state will fail with an audible message from the base station that sensors require bypass. Arming will retry 5 times every 10 seconds giving time for doors/windows to be closed, however, if sensors still require bypass after this time, arming will fail.

This addon exposes an Arming Bypass Mode switch which can by toggled to change this arming behavior. When this switch is "ON", arming commands will automatically bypass any faulted contact sensors or retrofit zones. This option always defaults to "OFF".  If you prefer the default state to be "ON" you can create an automation to toggle it in Home Assistant.

## Volume Control
Ring shared users do not have access to control the Base Station volume (any user can control Keypad volume).  Because of this, to enable control of Base Station volume using this addon, the refresh token must be generated using the primary Ring account. During startup the addon will detect if the account can control the base station volume and only enables the volume control if it determines the account has access. This is a limitation of the Ring API as even the official Ring App does not offer volume control to shared users for teh Base Station.

Volume controls are presented in Home Assistant as number entities on the devices.  You can change them via the Lovalace UI or via Home Assistant automations.

## Branch Feature
The branch feature is designed to make testing the latest code easier for addon users. If you want to test the latest code from the ring-mqtt Github project simply set the branch options to "latest" or "dev" and, during startup the addon will pull the latest code from the master or dev branch respectively.  To revert to stock code for the addon simply change the option back to "addon" in the config and restart.  Note that this setting is recommended for testing only as it requires an internet connection to start and the dev branch may not always be in a fully functional state.
