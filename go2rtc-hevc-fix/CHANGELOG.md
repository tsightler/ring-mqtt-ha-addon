# Changelog

## 1.9.14-hevcfix.1

- Initial release. go2rtc 1.9.14 built from source with upstream PR #2296
  (de-aggregate RFC 7798 HEVC aggregation packets in the H.265 depayloader), so
  HEVC cameras served through an ffmpeg-wrapped RTSP source play instead of
  freezing or showing a green screen. Identical to the official go2rtc add-on
  otherwise.
