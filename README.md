![gridcoin logo](https://github.com/gridcoin-community/Gridcoin-Research/blob/development/share/icons/hicolor/48x48/apps/gridcoinresearch.png "gridcoin logo")

### gridcoincommunity/grc-dev

Multiarch compilation environments with generous dependencies and tools for building gridcoinresearch & gridcoinresearchd available at [Docker Hub](https://hub.docker.com/r/gridcoincommunity/grc-dev)

     gridcoincommunity/grc-dev:bionic      linux/amd64, linux/arm64, linux/arm/v7, linux/386
     gridcoincommunity/grc-dev:buster      linux/amd64, linux/arm64, linux/arm/v7, linux/386
     gridcoincommunity/grc-dev:focal       linux/amd64, linux/arm64, linux/arm/v7
     gridcoincommunity/grc-dev:bullseye    linux/amd64, linux/arm64, linux/arm/v7, linux/386
     gridcoincommunity/grc-dev:jammy       linux/amd64, linux/arm64, linux/arm/v7
     gridcoincommunity/grc-dev:bookworm    linux/amd64, linux/arm64, linux/arm/v7, linux/386

A Swiss army knife build container for the adventurous gridcoiner.

Gridcoin is a peer-to-peer cryptocurrency that uses distributed computing (BOINC) to benefit humanity by advancing the progress of medicine, biology, climatology, mathematics, astrophysics, and more.

The aim of the Gridcoin project is to shift the computational power primarily to BOINC projects whilst the POW mining calculations become a second priority - so as the mining network scales up, the network's BOINC contribution is scaled up in tandem.

The build dependencies and other tools are generous to cater for local compilation or debian packaging needs, on Ubuntu or Debian.

### Unsecure: Not intended for any kind of exposure. This is a disposable development environment.

user:password = dev:dev; sudo is not enabled, but you may exit to root to modify the container. (sudo can be finicky in containers)

You may return to ordinary user with dev@xxxxxxxxx:~#su - dev

dev's default uid=1000; this can be changed to match your host user's uid by adding [-e HOST_USER_ID=*xxxx*] to the docker run statement.

The correct architecture will be downloaded to match your host; this can be changed for cross compiling by adding [--platform=*target-platform*] to the docker run statement.

In this example, items [enclosed in brackets] are optional:

>docker run --rm -it [--platform=target-platform -e HOST_USER_ID=xxxx] --name grc-dev-focal -v *path2/build/folder*:/home/dev gridcoincommunity/grc-dev:jammy

>git clone https://github.com/gridcoin/Gridcoin-Research && cd Gridcoin-Research

>./autogen.sh && ./configure --with-incompatible-bdb && make

strip the desired binary(s) and make install on your host machine

Report issues or contribute to gridcoin-docker at [https://github.com/gridcoin-community/gridcoin-docker](https://github.com/gridcoin-community/gridcoin-docker)

Contribute to gridcoin itself at [https://github.com/gridcoin-community/Gridcoin-Research](https://github.com/gridcoin-community/Gridcoin-Research)

More info and guides at [www.gridcoin.us](www.gridcoin.us)
