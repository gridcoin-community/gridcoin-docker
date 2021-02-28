![gridcoin logo](https://github.com/gridcoin-community/Gridcoin-Research/blob/development/share/icons/hicolor/48x48/apps/gridcoinresearch.png "gridcoin logo")

*gridcoincommunity/grc-amd64-dev:(bionic, buster, focal, bullseye)*  at [DockerHub](https://hub.docker.com/r/gridcoincommunity/grc-amd64-dev)

Compilation environments with generous dependencies and tools for building gridcoinresearch & gridcoinresearchd

A Swiss army knife build container for the adventurous gridcoiner.

Gridcoin is a peer-to-peer cryptocurrency that uses distributed computing (BOINC) to benefit humanity by advancing the progress of medicine, biology, climatology, mathematics, astrophysics, and more.

The aim of the Gridcoin project is to shift the computational power primarily to BOINC projects whilst the POW mining calculations become a second priority - so as the mining network scales up, the network's BOINC contribution is scaled up in tandem.

The build dependencies and other tools are generous to cater for local compilation or debian packaging needs, on Ubuntu or Debian. The Dockerfile can be repurposed instantly for =>ubuntu:bionic or =>debian:buster

### Unsecure: Not intended for any kind of exposure. This is a disposable development environment.

user:password = dev:dev; sudo is enabled, with NOPASSWD (sudo can be finicky in containers)

dev's uid=1000, can be changed to match your host user's uid by adding [-e HOST_USER_ID=xxxx] to the *docker run* statement

example:

>docker run --rm -it --name grc-bionic -v path2/build/folder:/home/dev [-e HOST_USER_ID=xxxx] gridcoincommunity/grc-amd64-dev:bionic

>git clone https://github.com/gridcoin/Gridcoin-Research && cd Gridcoin-Research

>./autogen.sh && ./configure --with-incompatible-bdb && make

strip the desired binary(s) and make install on your host machine

Report issues or contribute to gridcoin-docker at [https://github.com/gridcoin-community/gridcoin-docker](https://github.com/gridcoin-community/gridcoin-docker)

Contribute to gridcoin itself at [https://github.com/gridcoin-community/Gridcoin-Research](https://github.com/gridcoin-community/Gridcoin-Research)

More info and guides at [www.gridcoin.us](www.gridcoin.us)
