---
name: Open New Issue
about: Submit an new issue with the addon
title: "<---Please enter an brief summary of the issue--->"
labels: issue
assignees: tsightler

---

### PLEASE READ THIS FIRST ###
This page is for reporting issues related to the Ring Devices for Home Assistant addon.  This addon is just a wrapper for ring-mqtt designed to make it easier for Home Assistant users to use the ring-mqtt script.  Most issues should not be opened here but rather reported directly to the [ring-mqtt project page](https://github.com/tsightler/ring-mqtt).  Only open an issue here if you are experiencing a problem with installing or configuring the addon itself.

**Describe the issue**
A clear and concise description of the issue you are experiencing.  Please enter a brief summary of the issue in the title above as well.

**Debug Logs**
To effectively troubleshoot the issue logs will generally be required.  If your error is shown in the Home Assistant addon logs window, feel free to simply copy it here, however, this window only shows the last 60-70 lines and sometimes the error will not be shown in it's entirety or even at all.  Home Assistant makes it somewhat difficult to get full logs but it is possible to get the logs from the Docker container which hosts the addon using either a tool like the Portainer addon, or by using SSH and docker from the command line.  I've documented a short procedure here to [get full logs](https://github.com/tsightler/ring-mqtt-hassio-addon/blob/master/GET-LOGS.md) from the addon.  When possible, please include these logs when submitting a new issue.
