# go2rtc-hevc-fix

A drop-in replacement for the official **go2rtc** add-on, carrying one change: a
patched H.265 RTP depayloader that correctly handles aggregation packets. It
exists so HEVC cameras play in Home Assistant instead of freezing or showing a
green screen when their source is wrapped in ffmpeg.

## Why this add-on exists

When Home Assistant converts an RTSP camera to WebRTC, its generic-camera
integration wraps the source in ffmpeg (`ffmpeg:rtsp://…`), and ffmpeg
re-packetises the HEVC stream — bundling small NAL units of an access unit into a
single RTP **aggregation packet** (RFC 7798 §4.4.2, payload type 48).

Stock go2rtc's H.265 depayloader has no case for aggregation packets: it handles
only fragmentation units and single NAL units, and an aggregation packet falls
through and is emitted as corrupt slice data. The result is a stream that plays
for a second or two and then freezes, or a green screen from the start. (H.264 is
unaffected — that path uses a different depayloader.)

This bites any HEVC source that goes through ffmpeg's RTP packetizer, which
includes Ring cameras served via ring-mqtt but is not specific to them — cameras
whose native RTP never aggregates work fine until ffmpeg is inserted, at which
point ffmpeg starts aggregating and stock go2rtc mishandles it.

This add-on builds go2rtc from source with upstream **PR #2296**, which adds the
missing aggregation-packet handling. It is identical to the official add-on in
every other respect. When PR #2296 ships in a go2rtc release, this add-on is no
longer needed — switch back to the official one.

## Installation

1. Add this repository to Home Assistant: **Settings → Add-ons → Add-on Store →
   ⋮ → Repositories**, then add
   `https://github.com/tsightler/ring-mqtt-ha-addon`.
2. Install **go2rtc-hevc-fix**. Unlike most add-ons it is **built on your device**
   the first time (it compiles the patched go2rtc), so the initial install takes
   a few minutes; later starts are instant.
3. In **Settings → Devices & Services → go2rtc**, set the integration to use an
   external go2rtc instance at `http://<home-assistant-host>:1984`, or stop the
   embedded go2rtc so this one serves in its place.

## Configuration

There are no add-on options — configuration is the go2rtc config file at
`/config/go2rtc.yaml` (in the add-on's config share), exactly as with the
official add-on. go2rtc and Home Assistant manage its contents; edits persist
across restarts.

## Ports and coexistence

This add-on uses host networking and the standard go2rtc ports (1984, 8554,
8555), the same as the official go2rtc add-on. That does **not** clash with:

- **Home Assistant's embedded go2rtc**, which listens on shifted ports (11984,
  etc.) specifically so a standard-port go2rtc add-on can run beside it. Point
  the go2rtc integration at this add-on to use it in place of the embedded one.
- **An RTSP provider such as the ring-mqtt add-on**, whose RTSP port is not
  published to the host by default — it lives inside that add-on's own network
  namespace, so go2rtc's host-side RTSP port does not collide with it.

The one exception: if another service publishes RTSP on the host's port 8554
(for example, enabling ring-mqtt's *external* RTSP port), it and go2rtc's RTSP
listener will both want host 8554. In that case, give go2rtc a different RTSP
port in `/config/go2rtc.yaml`:

```yaml
rtsp:
  listen: ":18554"
```

Any free port works; go2rtc only uses it locally.

## Reverting

Uninstall this add-on and re-enable the embedded or official go2rtc. Your
`/config/go2rtc.yaml` is untouched by the switch.
