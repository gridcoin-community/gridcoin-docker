FROM --platform=$TARGETPLATFORM ubuntu:focal as grc-build-deps-focal
MAINTAINER caraka@gridcoin.us

# The build-deps are generous to cater for local compilation or debian packaging

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
	nano \
    software-properties-common &&\
	apt clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# the following are for Windows executable compiling, Ubuntu LTS amd64 only
RUN if [ "$TARGETPLATFORM" = "linux/amd64" ] ; then \
        export DEBIAN_FRONTEND='noninteractive' &&\
        apt install -y --no-install-recommends \
	    g++-mingw-w64-x86-64 \
	    g++-mingw-w64-i686 \
	    mingw-w64-i686-dev &&\
        apt clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* ; \
    fi

# build the devtime stage, using cached build-deps stage:
FROM grc-build-deps-focal as grcdevfocal
LABEL stage="grcdevfocal"

COPY start.sh /usr/local/bin/start.sh

RUN /bin/bash -c 'chmod +x /usr/local/bin/start.sh' \
	export DEBIAN_FRONTEND='noninteractive' &&\
	apt update && apt upgrade -y -o Dpkg::Options::="--force-confold" &&\
	apt clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENTRYPOINT ["/usr/local/bin/start.sh"]
