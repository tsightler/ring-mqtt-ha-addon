### Gathering logs in HassOS

When submitting a bug report one item of critical importance is gathering proper, full logs.  While Hass.io does show addon logs in the web interface it is only the most recent and sometimes misses critical errors that are useful for troubleshooting issues, especially if those error cause the script to exit.  The steps below can be used to gather a full set of logs from the startup of the docker container to shutdown:

1) Install the excellent [SSH & Web Terminal](https://github.com/hassio-addons/addon-ssh) addon (available in the Community addons section - search "Web Terminal") 
2) Configure the addon with an SSH password (strong password) or public key
3) Disable "Protection mode" in the addon, this is required to access docker commands in Hass.io
4) Start the addon and connect to the system via SSH or the web terminal
5) In the terminal copy and paste the following command to dump the current addon logs to a file:
```
docker logs `docker ps | grep ring-mqtt | cut -f 1 -d ' '` > ring-mqtt.log 2&>1
```
6) Using a tool like WinSCP to copy the ring-mqtt.log file to your computer 
7) Delete the ring-mqtt.log file on your Home Assistant instance before existing SSH
