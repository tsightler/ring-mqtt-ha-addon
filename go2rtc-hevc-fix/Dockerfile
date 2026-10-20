# go2rtc-hevc-fix builds a patched go2rtc from source rather than pulling a
# prebuilt image, so the fix is fully self-contained in this repository and needs
# no external registry. The patch is upstream go2rtc PR #2296; GO2RTC_VERSION is
# the release it is applied to and must match the tag the patch was generated
# against.
ARG BUILD_FROM

FROM golang:1.25-alpine AS build
ARG GO2RTC_VERSION=1.9.14
RUN apk add --no-cache git
WORKDIR /src
RUN git -c advice.detachedHead=false clone --depth 1 \
        --branch "v${GO2RTC_VERSION}" https://github.com/AlexxIT/go2rtc.git .
COPY go2rtc-hevc-ap.patch /tmp/go2rtc-hevc-ap.patch
# Apply the patch, prove the patched package's tests pass, then build. A build
# only exists if the aggregation-packet fix compiled and its tests are green.
RUN git apply /tmp/go2rtc-hevc-ap.patch \
    && go test ./pkg/h265/ \
    && CGO_ENABLED=0 go build -trimpath -ldflags "-s -w" -o /go2rtc .

FROM ${BUILD_FROM}
# go2rtc spawns ffmpeg for any "ffmpeg:" source, which is how Home Assistant
# wraps RTSP cameras. The Home Assistant base image ships no ffmpeg, so install
# it. This is Alpine's software ffmpeg (no hardware acceleration, unlike the
# official go2rtc image), which is sufficient for the copy/repackage and Opus
# audio that the ffmpeg-wrapped sources use.
RUN apk add --no-cache ffmpeg
COPY --from=build /go2rtc /usr/local/bin/go2rtc
COPY rootfs /
RUN chmod +x /etc/s6-overlay/s6-rc.d/go2rtc/run
