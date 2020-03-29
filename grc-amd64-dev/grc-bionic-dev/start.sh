#!/bin/bash

# Update the system
apt-get update && apt-get upgrade -y --no-install-recommends

# Add local user dev
# Either use the LOCAL_USER_ID if passed in at runtime or fallback
USER_ID=${LOCAL_USER_ID:-9001}
echo "Starting with UID : $USER_ID"
useradd --shell /bin/bash -u $USER_ID -o -c "" -m dev
export HOME=/home/dev
echo "dev:dev" | chpasswd
usermod -aG sudo dev

# Set the default mingw32 g++ compiler option to posix for Win64 builds
update-alternatives --set x86_64-w64-mingw32-g++ /usr/bin/x86_64-w64-mingw32-g++-posix

# Create and initialise debuild defaults
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
echo "sudo is enabled, with user:password = dev:dev"
echo "type 'exit' to drop to root and/or"
echo "type 'su - dev' to become dev again"
echo "you are now in the /home/dev directory as dev"
echo "."
su - dev
cd /home/dev
exec /bin/bash

