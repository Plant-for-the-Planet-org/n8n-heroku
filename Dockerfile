FROM n8nio/n8n:latest

USER root

RUN npm install @google/earthengine
USER node

WORKDIR /home/node/packages/cli
ENTRYPOINT []

# copy start script to container
COPY ./start.sh /

# make the script executable
RUN chmod +x /start.sh

# define execution entrypoint
CMD ["/start.sh"]
