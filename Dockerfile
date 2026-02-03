FROM n8nio/n8n:latest

USER root

# Installer ffmpeg directement depuis les repos Alpine
RUN apk update && apk add --no-cache ffmpeg

# Vérification
RUN ffmpeg -version

USER node
