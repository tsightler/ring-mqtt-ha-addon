# go2rtc-hevc-fix

A [go2rtc](https://github.com/AlexxIT/go2rtc) add-on that adds one fix HEVC
cameras need and nothing else — a drop-in replacement for the official go2rtc
add-on.

Stock go2rtc's H.265 RTP depayloader does not handle RFC 7798 aggregation
packets, which ffmpeg produces when Home Assistant wraps an RTSP source. The
result is HEVC that freezes after a second or two, or a green screen. This add-on
builds go2rtc from source with upstream
[PR #2296](https://github.com/AlexxIT/go2rtc/pull/2296) applied.

It is meant to be temporary: once PR #2296 is in a go2rtc release, switch back to
the official add-on. See [DOCS.md](DOCS.md) for installation and configuration.
