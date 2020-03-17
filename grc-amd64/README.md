![gridcoin logo](https://github.com/gridcoin-community/Gridcoin-Research/blob/development/share/icons/hicolor/48x48/apps/gridcoinresearch.png "gridcoin logo")

A Swiss army knife build container for the adventurous gridcoiner.

Gridcoin is a peer-to-peer cryptocurrency that uses distributed computing (BOINC) to benefit humanity by advancing the progress of medicine, biology, climatology, mathematics, astrophysics, and more.

The aim of the Gridcoin project is to shift the computational power primarily to BOINC projects whilst the POW mining calculations become a second priority - so as the mining network scales up, the network's BOINC contribution is scaled up in tandem.

The build dependencies and other tools are generous to cater for local compilation or debian packaging needs, on Ubuntu or Debian. The Dockerfile can be repurposed instantly for =>ubuntu:bionic or =>debian:buster

### Unsecure: Not intended for any kind of exposure.

sudo enabled for user dev:dev so changes can be made to the build environment as required.

set the container's LOCAL_USER_ID='1000' for clean operation from your local drive

example:

docker run --rm -it --name grc-bionic -v /$HOME/build/bionic:/home/dev -e LOCAL_USER_ID='1000' caraka/grc-amd64:bionic

git clone https://github.com/gridcoin/Gridcoin-Research && cd Gridcoin-Research

./autogen.sh && ./configure --with-incompatible-bdb && make

strip the desired binary(s) and make install

Contribute to gridcoin-docker at [https://github.com/gridcoin-community/gridcoin-docker](https://github.com/gridcoin-community/gridcoin-docker)

Contribute to gridcoin itself at [https://github.com/gridcoin-community/Gridcoin-Research](https://github.com/gridcoin-community/Gridcoin-Research)

More info and guides at [www.gridcoin.us](www.gridcoin.us)
