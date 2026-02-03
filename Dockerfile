FROM n8nio/n8n:latest

USER root

# Installer ffmpeg avec apt (Debian/Ubuntu) au lieu de apk (Alpine)
RUN apt-get update && \
    apt-get install -y ffmpeg && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Vérification
RUN ffmpeg -version

USER node
