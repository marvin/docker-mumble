# -----------------------------------------------------------------------------
# docker-mumble
#
# Builds a basic docker image that can run Mumble
# (http://mumble.sourceforge.net/).
#
# Authors: Isaac Bythewood, Azim Sonawalla
# Updated: Jan 21, 2015
# Require: Docker (http://www.docker.io/)
# -----------------------------------------------------------------------------

FROM debian:jessie

# Download and install everything from the repos.
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y mumble-server supervisor pwgen && \
    rm -rf /var/lib/apt/lists

# Copy configuration
ADD ./supervisor/supervisord.conf /etc/supervisor/supervisord.conf
ADD ./supervisor/conf.d/murmurd.conf /etc/supervisor/conf.d/murmur.conf
ADD ./mumble/mumble-server.ini /etc/mumble-server.ini
ADD ./scripts/start /start
RUN chmod +x /start

EXPOSE 64738
VOLUME ["/data"]

ENTRYPOINT ["/start"]
