FROM mwader/static-ffmpeg:latest AS ffmpeg
FROM n8nio/n8n:latest

USER root

# Copier les binaires statiques
COPY --from=ffmpeg /ffmpeg /usr/local/bin/ffmpeg
COPY --from=ffmpeg /ffprobe /usr/local/bin/ffprobe

# Rendre exécutables
RUN chmod +x /usr/local/bin/ffmpeg /usr/local/bin/ffprobe

# Vérification
RUN ffmpeg -version

USER node
