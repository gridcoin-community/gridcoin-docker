FROM debian:stretch as grc-amd64-build-deps-stretch
LABEL maintainer="caraka@gridcoin.us"

# The build-deps are generous to cater for local compilation or debian package
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
	quilt \
	debian-keyring \
	libdistro-info-perl \
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
	qtbase5-dev \
    qttools5-dev-tools \
	libqt5svg5-dev \
	libcurl4-openssl-dev \
	libzip-dev \
	zlib1g-dev \
	python3 \
	curl \
	wget \
	apt-utils \
	sudo \
	git \
    software-properties-common \
	nano &&\
	# update to backported debhelper 12.x for easier package backporting (bionic & stretch only)
    echo "deb http://ftp.debian.org/debian stretch-backports main" | tee /etc/apt/sources.list.d/backports.list &&\
	apt update && apt install -y -t stretch-backports debhelper &&\
	apt clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# build the devtime stage, using cached build-deps stage:
FROM grc-amd64-build-deps-stretch as grc-amd64-dev-stretch
LABEL stage="grc-amd64-dev-stretch"

COPY start.sh /usr/local/bin/start.sh

RUN /bin/bash -c 'chmod +x /usr/local/bin/start.sh' \
	export DEBIAN_FRONTEND='noninteractive' &&\
	apt update && apt upgrade -y -o Dpkg::Options::="--force-confold" &&\
	apt clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENTRYPOINT ["/usr/local/bin/start.sh"]
