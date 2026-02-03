FROM mwader/static-ffmpeg:latest AS ffmpeg

FROM n8nio/n8n:latest

USER root

# Copier ffmpeg dans un chemin standard garanti
COPY --from=ffmpeg --chmod=0755 /ffmpeg /usr/bin/ffmpeg
COPY --from=ffmpeg --chmod=0755 /ffprobe /usr/bin/ffprobe

# Vérification au build (debug)
RUN /usr/bin/ffmpeg -version

USER node
