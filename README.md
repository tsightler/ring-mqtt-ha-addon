# Ring-MQTT Home Assistant Add-on Repository

A Home Assistant add-on repository containing:

## [Ring-MQTT with Video Streaming](ring-mqtt/)

Integrate Ring devices into Home Assistant via MQTT, with live and recorded
video served over RTSP. This is the main add-on — see
[ring-mqtt/DOCS.md](ring-mqtt/DOCS.md).

## [go2rtc-hevc-fix](go2rtc-hevc-fix/)

A drop-in replacement for the official go2rtc add-on that adds a single fix:
HEVC RTP aggregation-packet handling (upstream go2rtc
[PR #2296](https://github.com/AlexxIT/go2rtc/pull/2296)). Without it, HEVC
cameras whose RTSP source is wrapped in ffmpeg — including Ring cameras served
through the add-on above — freeze after a second or two or show a green screen in
Home Assistant. It is temporary, until the fix ships in a go2rtc release. See
[go2rtc-hevc-fix/DOCS.md](go2rtc-hevc-fix/DOCS.md).

## Installing

In Home Assistant: **Settings → Add-ons → Add-on Store → ⋮ → Repositories**, add

```
https://github.com/tsightler/ring-mqtt-ha-addon
```

then install either add-on from the store.
