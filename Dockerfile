FROM mwader/static-ffmpeg:latest AS ffmpeg

FROM n8nio/n8n:latest
USER root

COPY --from=ffmpeg --chmod=0755 /usr/bin/ffmpeg /usr/local/bin/ffmpeg

USER node
