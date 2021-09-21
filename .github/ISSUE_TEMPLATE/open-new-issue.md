---
name: Open New Issue
about: Submit an new issue with the addon
title: "<---Please enter an brief summary of the issue--->"
labels: issue
assignees: tsightler

---

### PLEASE READ THIS FIRST ###
This page is for reporting issues related to the Ring Devices for Home Assistant addon.  This addon is just a wrapper for ring-mqtt designed to make it easier for Home Assistant users to use the ring-mqtt script.  Most issues should not be opened here but rather reported directly to the [ring-mqtt project page](https://github.com/tsightler/ring-mqtt).  Only open an issue here if you are experiencing a problem with installing or configuring the addon itself.

I've tried to keep this report template short and simple and I understand not everyone knows how to dig into various parts of Home Assistant, however, if you can't be bothered to put enough effort into opening an issue to read this template, provide at least basic information about your devices, or at lest the device you are having a problem with, and some details about what you've tried to resolve the issue, then I will put a similar amount of effort into my response.  I'm not customer support, you didn't pay me anything, and I don't work for Ring or have anything to do with them or the decisions they make about their platform and devices.

**Describe the issue**
A clear and concise description of the issue you are experiencing and make sure to include relevant information regarding your setup, including device/camera types, platform you are running, etc.  Please enter a brief summary of the issue in the title above as well.

**Debug Logs**
To effectively troubleshoot the issue logs will generally be required.  If your error is shown in the Home Assistant addon logs window, feel free to simply copy it here, however, this window only shows the last 60-70 lines and sometimes the error will not be shown in it's entirety or even at all.  You can gett full logs from the addon using either a tool like the Portainer addon, or by using SSH and docker from the command line.  I've documented a short procedure here to [get full logs](https://github.com/tsightler/ring-mqtt-hassio-addon/blob/master/GET-LOGS.md) using SSH.  When possible, please include these logs when submitting a new issue.  Log snippets are OK too, but many times are not sufficient to understand the issue.

If you are not comfortable placing your logs publicly, which I certainly understand, feel free to email them to me directly using my same username at gmail.  Please include a reference to the issue number in the subject line.  I keep logs only long enough to analyze the issue at hand and then they are deleted.
