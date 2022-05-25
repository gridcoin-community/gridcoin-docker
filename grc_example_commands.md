## gridcoincommunity/grc-dev

You will need an up-to-date docker-ce and qemu-user-static properly linked with docker.

Note: Running the cross-compiled Bullseye containers requires qemu version => 5.0. This is available on => Ubuntu 20.10 or or => Buster or via a PPA on Ubuntu 20.04. It is not available for Ubuntu 18.04

PPA for qemu version 5 on 20.04:

https://launchpad.net/~ci-train-ppa-service/+archive/ubuntu/4535/+packages
______________________________________________________________________________________________________

The following commands are used to run the community containers. Amend paths to suit your needs.

Remember that sudo is very unreliable in containers. It is best to $exit to root to modify the container and then #su - dev to return to the default user before building.
______________________________________________________________________________________________________

#### (bionic amd64)
docker run --rm -it --platform linux/amd64 --name bionic -v $HOME/build/bionic:/home/dev gridcoincommunity/grc-dev:bionic /bin/bash

#### (bionic arm32v7)
docker run --rm -it --platform linux/arm/v7 --name bionic_arm32v7 -v $HOME/build/bionic_arm32v7:/home/dev gridcoincommunity/grc-dev:bionic /bin/bash

#### (bionic i386)
docker run --rm -it --platform linux/386 --name bionic_i386 -v $HOME/build/bionic_i386:/home/dev gridcoincommunity/grc-dev:bionic /bin/bash

#### (bionic arm64)
docker run --rm -it --platform linux/arm64 --name bionic_arm64 -v $HOME/build/bionic_arm64v8:/home/dev gridcoincommunity/grc-dev:bionic /bin/bash
______________________________________________________________________________________________________

#### (buster amd64)
docker run --rm -it --platform linux/amd64 --name buster -v $HOME/build/buster:/home/dev gridcoincommunity/grc-dev:buster /bin/bash

#### (buster i386)
docker run --rm -it --platform linux/386 --name buster_i386 -v $HOME/build/buster_i386:/home/dev gridcoincommunity/grc-dev:buster /bin/bash

#### (buster arm32v7)
docker run --rm -it --platform linux/arm/v7 --name buster_arm32v7 -v $HOME/build/buster_arm32v7:/home/dev gridcoincommunity/grc-dev:buster /bin/bash

#### (buster arm64)
docker run --rm -it --platform linux/arm64 --name buster_arm64 -v $HOME/build/buster_arm64v8:/home/dev gridcoincommunity/grc-dev:buster /bin/bash
______________________________________________________________________________________________________

#### (focal amd64)
docker run --rm -it --platform linux/amd64 --name focal -v $HOME/build/focal:/home/dev gridcoincommunity/grc-dev:focal /bin/bash

#### (focal arm32v7)
docker run --rm -it --platform linux/arm/v7 --name focal_arm32v7 -v $HOME/build/focal_arm32v7:/home/dev gridcoincommunity/grc-dev:focal /bin/bash

#### (focal arm64)
docker run --rm -it --platform linux/arm64 --name focal_arm64 -v $HOME/build/focal_arm64:/home/dev gridcoincommunity/grc-dev:focal /bin/bash
______________________________________________________________________________________________________

#### (bullseye amd64)
docker run --rm -it --platform linux/amd64 --name bullseye -v $HOME/build/bullseye:/home/dev gridcoincommunity/grc-dev:bullseye /bin/bash

#### (bullseye i386)
docker run --rm -it --platform linux/386 --name bullseye_i386 -v $HOME/build/bullseye_i386:/home/dev gridcoincommunity/grc-dev:bullseye /bin/bash

#### (bullseye arm32v7)
docker run --rm -it --platform linux/arm/v7 --name bullseye_arm32v7 -v $HOME/build/bullseye_arm32v7:/home/dev gridcoincommunity/grc-dev:bullseye /bin/bash

#### (bullseye arm64)
docker run --rm -it --platform linux/arm64 --name bullseye_arm64 -v $HOME/build/bullseye_arm64v8:/home/dev gridcoincommunity/grc-dev:bullseye /bin/bash
______________________________________________________________________________________________________

#### (jammy amd64)
docker run --rm -it --platform linux/amd64 --name jammy -v $HOME/build/jammy:/home/dev gridcoincommunity/grc-dev:jammy /bin/bash

#### (jammy arm32v7)
docker run --rm -it --platform linux/arm/v7 --name jammy_arm32v7 -v $HOME/build/jammy_arm32v7:/home/dev gridcoincommunity/grc-dev:jammy /bin/bash

#### (jammy arm64)
docker run --rm -it --platform linux/arm64 --name jammy_arm64 -v $HOME/build/jammy_arm64:/home/dev gridcoincommunity/grc-dev:jammy /bin/bash
______________________________________________________________________________________________________

### Build all the things

The following commands are used to build the community containers for docker hub. Amend paths and the builder.sh files to suit your own local or hub-based, cross-compiled builds.

#### (bionic multiarch to Docker Hub)
cd $HOME/build/gridcoin-docker/grc-dev/grc-dev-bionic && ./builder.sh

#### (buster multiarch to Docker Hub)
cd $HOME/build/gridcoin-docker/grc-dev/grc-dev-buster && ./builder.sh

#### (focal multiarch to Docker Hub)
cd $HOME/build/gridcoin-docker/grc-dev/grc-dev-focal && ./builder.sh

#### (bullseye multiarch to Docker Hub)
cd $HOME/build/gridcoin-docker/grc-dev/grc-dev-bullseye && ./builder.sh

#### (jammy multiarch to Docker Hub)
cd $HOME/build/gridcoin-docker/grc-dev/grc-dev-jammy && ./builder.sh

