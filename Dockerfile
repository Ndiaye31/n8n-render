FROM mwader/static-ffmpeg:latest AS ffmpeg

FROM n8nio/n8n:latest
USER root

COPY --from=ffmpeg --chmod=0755 /ffmpeg  /usr/local/bin/ffmpeg
COPY --from=ffmpeg --chmod=0755 /ffprobe /usr/local/bin/ffprobe

USER node
