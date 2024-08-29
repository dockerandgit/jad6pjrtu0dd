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

# Set the working directory
WORKDIR /app

# Copy your script and any other necessary files into the container
COPY /script.sh /app/

# Make your script executable
RUN chmod +x /app/script.sh

# Set the entrypoint to execute your script
ENTRYPOINT ["/app/script.sh"]
