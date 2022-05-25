#!/bin/bash

# Update the system
apt-get update && apt-get upgrade -y --no-install-recommends

# add dev user using HOST_USER_ID if passed in at runtime; fallback uid=1000
USER_ID=${HOST_USER_ID:-1000}
useradd --shell /bin/bash -u $USER_ID -o -c "" -m dev
export HOME=/home/dev

# Set the default mingw32 g++ compiler option to posix for Win64 builds (bionic & focal only)
if [ "$(lsb_release -sc)" = "bionic" || "$(lsb_release -sc)" = "focal" || "$(lsb_release -sc)" = "jammy" ]; then
    update-alternatives --set x86_64-w64-mingw32-g++ /usr/bin/x86_64-w64-mingw32-g++-posix
    echo "We have set the default mingw32 g++ compiler option to posix for Win64 builds"
fi

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

# for i386 containers only
if [ "$(dpkg --print-architecture)" = "i386" ]; then
   FOLDER=$(ls -d /home/dev/*ridcoin* | head -n1);
   echo "."
   echo "Architecture is i386, build folder is $FOLDER"
   sed -i.bak 's/--disable-tests/--disable-tests --with-boost-libdir=\/usr\/lib\/i386-linux-gnu/' $FOLDER/debian/rules
   echo "Updated ./configure in $FOLDER/debian/rules for i386 boost path"
fi

# some messaging
echo "."
echo "Started with UID : $USER_ID"
echo "user:password = dev:dev"
echo "sudo is not enabled, but you may exit to root shell"
echo "and return to ordinary user with dev@xxxxxxxxx:~#su - dev"
echo "you are currently in the /home/dev directory as dev"
echo "."
su - dev
cd /home/dev
exec /bin/bash
