FROM n8nio/n8n:1.11.1

USER root

WORKDIR /home/node/packages/cli
ENTRYPOINT []

# copy start script to container
COPY ./start.sh /

# make the script executable
RUN chmod +x /start.sh

# define execution entrypoint
CMD ["/start.sh"]
