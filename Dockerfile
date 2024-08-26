FROM n8nio/n8n:latest

USER root

# Install necessary libraries for Chromium and other dependencies for puppeteer
RUN apt-get update && apt-get install -y \
    ca-certificates \
    fonts-liberation \
    libappindicator3-1 \
    libasound2 \
    libatk-bridge2.0-0 \
    libatk1.0-0 \
    libcups2 \
    libdbus-1-3 \
    libdrm2 \
    libgbm1 \
    libgtk-3-0 \
    libnspr4 \
    libnss3 \
    libxcomposite1 \
    libxdamage1 \
    libxrandr2 \
    xdg-utils \
    wget \
    --no-install-recommends \
    && rm -rf /var/lib/apt/lists/*

# Install Puppeteer globally
RUN npm install -g puppeteer

# Install n8n-nodes-puppeteer-extended and @google/earthengine locally in the n8n directory
WORKDIR /usr/local/lib/node_modules/n8n
RUN npm install n8n-nodes-puppeteer-extended @google/earthengine

# Set working directory and environment for Puppeteer
WORKDIR /home/node/packages/cli
ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD true

# Entry point configuration
ENTRYPOINT []

# Copy start script to container
COPY ./start.sh /

# Make the script executable
RUN chmod +x /start.sh

# Define execution entrypoint
CMD ["/start.sh"]
