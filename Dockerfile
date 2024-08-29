# Use an official lightweight image
FROM debian:bullseye-slim

# Set the environment to non-interactive to avoid prompts during install
ENV DEBIAN_FRONTEND=noninteractive

# Install required packages
RUN apt-get update && apt-get install -y \
    curl \
    jq \
    bash \
    findutils \
    && rm -rf /var/lib/apt/lists/*

# Create the configuration directory
RUN mkdir /config

# Set the working directory
WORKDIR /config

# Make your script executable
RUN chmod +x /config/script.sh

# Set the entrypoint or command to run your external script
ENTRYPOINT ["bash", "/config/script.sh"]
