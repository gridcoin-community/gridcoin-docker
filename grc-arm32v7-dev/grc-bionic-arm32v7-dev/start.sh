#!/bin/bash

# this script is run as user 'dev'

# update the system
apt-get update && apt-get upgrade -y --no-install-recommends

# create and initialise debuild defaults
export HOME=/home/dev
echo "dev:dev" | chpasswd
rm /home/dev/.devscripts || true
echo "creating a new .devscripts file in /home/dev"
touch /home/dev/.devscripts
cat <<EOT >> /home/dev/.devscripts
DEBUILD_DPKG_BUILDPACKAGE_OPTS="-i -us -uc"
DEBUILD_LINTIAN_OPTS="-i -I --show-overrides"
EOT
chown dev:dev /home/dev/.devscripts

# some messaging
echo "."
echo "user:password = dev:dev"
echo "sudo is enabled, with NOPASSWD"
echo "you are currently in the /home/dev directory as dev"
echo "."
su - dev
cd /home/dev
exec /bin/bash
