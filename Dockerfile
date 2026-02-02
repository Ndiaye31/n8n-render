# Stage 1: récupérer ffmpeg + ffprobe (binaires statiques)
FROM mwader/static-ffmpeg:latest AS ffmpeg

# Stage 2: image n8n (distroless/minimale)
FROM n8nio/n8n:latest

USER root

# Copy avec permissions (pas besoin de chmod / pas besoin de package manager)
COPY --from=ffmpeg --chmod=0755 /usr/local/bin/ffmpeg /usr/local/bin/ffmpeg
COPY --from=ffmpeg --chmod=0755 /usr/local/bin/ffprobe /usr/local/bin/ffprobe

USER node
