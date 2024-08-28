FROM n8nio/n8n:latest

USER root

RUN cd /usr/local/lib/node_modules/n8n && npm install n8n-nodes-puppeteer-extended && npm install @google/earthengine && npm install -g @turf/turf && npm install -g @turf/union

WORKDIR /home/node/packages/cli

# Entry point configuration
ENTRYPOINT []

# Copy start script to container
COPY ./start.sh /

# Make the script executable
RUN chmod +x /start.sh

# Define execution entrypoint
CMD ["/start.sh"]
