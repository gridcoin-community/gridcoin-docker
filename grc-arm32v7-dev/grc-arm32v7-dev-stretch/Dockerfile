FROM arm32v7/debian:stretch-slim as grc-arm32v7-stretch-build-deps
MAINTAINER caraka@gridcoin.us

COPY qemu-arm-static /usr/bin/qemu-arm-static

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
	apt install -y -t stretch-backports debhelper &&\
	apt clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

	# build the devtime stage, using cached build-deps stage:

	FROM grc-arm32v7-stretch-build-deps as grcarm32v7devstretch

	COPY start.sh /usr/local/bin/start.sh

	RUN /bin/bash -c 'chmod +x /usr/local/bin/start.sh' \
		export DEBIAN_FRONTEND='noninteractive' &&\
		apt update && apt upgrade -y -o Dpkg::Options::="--force-confold" &&\
		apt clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

	# add local user dev
	RUN useradd --shell /bin/bash -u 1000 -o -c "" -m dev &&\
		usermod -aG sudo dev &&\
		echo "dev ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers &&\
		mkdir -p /home/dev/bin

	ENTRYPOINT ["/usr/local/bin/start.sh"]
