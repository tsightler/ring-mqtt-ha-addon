***This add-on requires a working MQTT broker.  The Mosquitto MQTT add-on for Home Assistant is highly recommended.***

### Configuration
***Ring now requires two-factor authentication (2FA) so the username and password options have been removed from this add-on.***
***Please read the instructions below to generate a refresh token.***

With the 4.0 release of this addon, efforts have been made to dramatically simplify configuration.  No manual settings should be required except to enable optional features as desired.  MQTT settings are now read automatically via the Home Assistant services API so no manual MQTT configuraiton is needed and these options have been removed from the addon.  The web based token generator now fully integrates into Home Assistant via the Ingress functionality so is fully embedded into the Home Assistant UI and requires no external ports.

To genereate a token, simply open the web UI for the addon (takes 5-10 seconds to start after starting the addon) and follow the instructions in the wizard to enter your Ring username/password and then the 2FA code sent via email/text.  Once you enter your access information the add-on will save the current token and attempt to start the connection to the Ring servers.  You will ***NOT*** need to copy and paste the token to your configuration.  Refresh tokens are only valid for a limited time (typically 60 minutes) so, going forward, the script will acquire and save new refresh tokens to the state file.  You will ***NOT*** see your current refresh token in the configuraiton and the refresh_token field can remain blank in the add-on UI.

The add-on will ***ALWAYS*** attempt to connect with the most recently saved refresh token first.  If, for some reason, this refresh token doesn't work (changed password on account, which exires the token immediately, or add-on was offline for more than the token expire time, etc) simply use the web UI to generate a new token.  If you prefer the generate the refresh token via external means (via CLI or some other method) this is still possible, simply configure the "ring_token" option in the configuration and the add-on will try this token as a fallback if the saved token cannot be used or does not exist.

To configure this plugin please review the following options:

| Config Option | Description |
| --- | --- |
| enable_cameras | Default false since the native Ring component for Home Assistant supports these, set to true to use camera support in this add-on |
| enable_modes | For locations without a Ring alarm enable a control panel for setting Location Modes instead |
| enable_panic | When set to true, the alarm control panel device will expose two switches for activating panic alarms for police/fire (you can also build automations for police/fire alarms by monitoring these switches)  |
| ring_token | Used only as fallback, should be blank for most cases, please use the Web UI to generate a token |
| location_ids | Comma separated list of location Ids to limit devices.  Blank is all locations which the specified account has access to. |
