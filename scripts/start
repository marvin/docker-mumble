#!/bin/bash
# -----------------------------------------------------------------------------
# docker-mumble /start script
#
# Authors: Isaac Bythewood
# Updated: Oct 20th, 2014
# -----------------------------------------------------------------------------


# Copy over the base database to our data directory if it doesn't exist
if [ ! -f /data/database/mumble-server.sqlite ]
then
    mkdir -p /data/database/
    cp /var/lib/mumble-server/mumble-server.sqlite /data/database/mumble-server.sqlite
    chown -R mumble-server:mumble-server /data/database/
fi


# Set Mumble SuperUser password
if [ ! -f /data/superuser_password.txt ]
then
    SUPERUSER_PASSWORD=`pwgen -c -n -1 15`
    echo $SUPERUSER_PASSWORD > /data/superuser_password.txt
    murmurd -ini /etc/mumble-server.ini -supw $SUPERUSER_PASSWORD
    sleep 3
    echo
    echo "# ------------------------------------------------------------------------------"
    echo "# SuperUser Password"
    echo "#"
    echo "# Password: $SUPERUSER_PASSWORD"
    echo "#"
    echo "# Connect to the server as SuperUser and setup an admin user."
    echo "# ------------------------------------------------------------------------------"
    echo
fi


# Run supervisor which maintains the mumble server
/usr/bin/supervisord

