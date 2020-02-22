### Gathering logs in Hass.io

When submitting a bug report one item of critical importances is gathering proper, full logs.  While Hass.io does show addon logs in the web interface it is only the most recent and sometimes misses critical errors that are useful for troubleshooting issues, especially if those error cause the script to exit.  The steps below can be used to gather a full set of logs from the startup of the docker container to shutdown:

1) Install the excellent [SSH & Web Terminal](https://github.com/hassio-addons/addon-ssh) addon (available in the Community addons section - search "Web Terminal") 
2) Configure the addon with an SSH password (strong password) or public key
3) Disable "Protection mode" in the addon, this is required to access docker commands in Hass.io
4) Start the addon and connect to the system via SSH (it's technically possible to use the Web terminal, but I find copy/paste operations there difficult)
5) Now in the SSH terminal copy and paste the following command in the terminal but do not yet press enter:
```
docker logs -f `docker ps | grep ring-mqtt | cut -f 1 -d ' '`
```
6) Now start the ring-mqtt addon and then swtich back to the SSH terminal and press enter, you should see logs from the build process and the logs will continue until the script exits.
7) After the script exits or once the error appears, copy and paste all relavant logs, especially error messages, and include them in the bug report.
