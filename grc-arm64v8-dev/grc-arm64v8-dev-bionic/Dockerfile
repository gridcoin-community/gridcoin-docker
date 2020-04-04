FROM arm64v8/ubuntu:bionic as grc-arm64v8-build-deps-bionic
MAINTAINER caraka@gridcoin.us

COPY qemu-aarch64-static /usr/bin/qemu-aarch64-static

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
	# update to backported debhelper 12.x for easier package backporting (bionic & stretch only)
	apt install -y -t bionic-backports debhelper &&\
	apt clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# build the devtime stage, using cached build-deps stage:
FROM grc-arm64v8-build-deps-bionic as grcarm64v8devbionic
LABEL stage="grcarm64v8devbionic"

COPY start.sh /usr/local/bin/start.sh

RUN /bin/bash -c 'chmod +x /usr/local/bin/start.sh' \
	export DEBIAN_FRONTEND='noninteractive' &&\
	apt update && apt upgrade -y -o Dpkg::Options::="--force-confold" &&\
	apt clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENTRYPOINT ["/usr/local/bin/start.sh"]
