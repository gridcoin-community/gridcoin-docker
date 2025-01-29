FROM debian:bullseye-slim AS grc-build-deps-bullseye
LABEL org.opencontainers.image.authors="caraka@gridcoin.us"

# The build-deps are generous to cater for local compilation or debian package

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
	libsecp256k1-dev \
	libcurl4-gnutls-dev \
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
	apt clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

FROM grc-build-deps-bullseye AS grcdevbullseye
LABEL stage="grcdevbullseye"

COPY start.sh /usr/local/bin/start.sh

RUN /bin/bash -c 'chmod +x /usr/local/bin/start.sh' \
	export DEBIAN_FRONTEND='noninteractive' &&\
	apt update && apt upgrade -y -o Dpkg::Options::="--force-confold" &&\
	apt clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENTRYPOINT ["/usr/local/bin/start.sh"]
