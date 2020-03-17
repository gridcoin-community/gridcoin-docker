FROM ubuntu:bionic
MAINTAINER caraka@gridcoin.us

# The build-deps are a bit fat to cater for local compilation or debian package
# building, on any Ubuntu or Debian =>ubuntu:bionic or =>debian:buster

# upgrade the OS and install gridcoin build env
RUN export DEBIAN_FRONTEND='noninteractive' &&\
	apt update && apt upgrade -y -o Dpkg::Options::="--force-confold" &&\
	apt update && apt install -y --no-install-recommends \
    build-essential \
    dh-exec \
	fakeroot \
    ca-certificates \
    debhelper \
	devscripts \
	automake \
	libtool \
    libevent-dev \
    bsdmainutils \
	libssl-dev \
	pkg-config \
	libdb++-dev \
    libboost-filesystem-dev \
    libboost-program-options-dev \
    libboost-system-dev \
    libboost-thread-dev \
    libboost-test-dev \
    libboost-chrono-dev \
    libboost-iostreams-dev \
	libqrencode-dev \
	libprotobuf-dev \
	protobuf-compiler \
	libminiupnpc-dev \
	qt5-default \
	qt5-qmake \
	qttools5-dev \
    libqt5svg5-dev \
	libqt5charts5-dev \
    libcurl4-openssl-dev \
    libzip-dev \
    zlib1g-dev \
    python3 \
    curl \
    wget \
    apt-utils \
    sudo \
    git \
    nano &&\
	apt clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY start.sh /usr/local/bin/start.sh
RUN /bin/bash -c 'chmod +x /usr/local/bin/start.sh'

ENTRYPOINT ["/usr/local/bin/start.sh"]
