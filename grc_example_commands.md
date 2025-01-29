## gridcoincommunity/grc-dev

You will need an up-to-date docker-ce and qemu-user-static properly linked with docker.
____________________________________________________________________________________________________

The following commands are used to run the community containers. Amend paths to suit your needs.

Note: sudo is very unreliable in containers. It is best to $exit to root to modify the container and then #su - dev to return to the default user before building.
______________________________________________________________________________________________________

### The following are required to compile gridcoin on bionic: (this is done already in the community builds)

apt install g++-8

update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-8 60 --slave /usr/bin/g++ g++ /usr/bin/g++-8

#### (bionic amd64)
docker run --rm -it --platform linux/amd64 --name bionic -v $HOME/build/bionic:/home/dev gridcoincommunity/grc-dev:bionic /bin/bash

#### (bionic i386)
docker run --rm -it --platform linux/386 --name bionic_i386 -v $HOME/build/bionic_i386:/home/dev gridcoincommunity/grc-dev:bionic /bin/bash

#### (bionic arm32v7)
docker run --rm -it --platform linux/arm/v7 --name bionic_arm32v7 -v $HOME/build/bionic_arm32v7:/home/dev gridcoincommunity/grc-dev:bionic /bin/bash

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

#### (bookworm amd64)
docker run --rm -it --platform linux/amd64 --name bookworm -v $HOME/build/bookworm:/home/dev gridcoincommunity/grc-dev:bookworm /bin/bash

#### (bookworm i386)
docker run --rm -it --platform linux/386 --name bookworm_i386 -v $HOME/build/bookworm_i386:/home/dev gridcoincommunity/grc-dev:bookworm /bin/bash

#### (bookworm arm32v7)
docker run --rm -it --platform linux/arm/v7 --name bookworm_arm32v7 -v $HOME/build/bookworm_arm32v7:/home/dev gridcoincommunity/grc-dev:bookworm /bin/bash

#### (bookworm arm64)
docker run --rm -it --platform linux/arm64 --name bookworm_arm64 -v $HOME/build/bookworm_arm64v8:/home/dev gridcoincommunity/grc-dev:bookworm /bin/bash
______________________________________________________________________________________________________

#### (trixie amd64)
docker run --rm -it --platform linux/amd64 --name trixie -v $HOME/build/trixie:/home/dev gridcoincommunity/grc-dev:trixie /bin/bash

#### (trixie i386)
docker run --rm -it --platform linux/386 --name trixie_i386 -v $HOME/build/trixie_i386:/home/dev gridcoincommunity/grc-dev:trixie /bin/bash

#### (trixie arm32v7)
docker run --rm -it --platform linux/arm/v7 --name trixie_arm32v7 -v $HOME/build/trixie_arm32v7:/home/dev gridcoincommunity/grc-dev:trixie /bin/bash

#### (trixie arm64)
docker run --rm -it --platform linux/arm64 --name trixie_arm64 -v $HOME/build/trixie_arm64v8:/home/dev gridcoincommunity/grc-dev:trixie /bin/bash
______________________________________________________________________________________________________

### Build all the things

The following commands are used to build the community containers for docker hub. Amend paths and the builder.sh files to suit your own local or hub-based, cross-compiled builds.

#### (focal multiarch to Docker Hub)
cd $HOME/build/gridcoin-docker/grc-dev/grc-dev-focal && ./builder.sh

#### (bullseye multiarch to Docker Hub)
cd $HOME/build/gridcoin-docker/grc-dev/grc-dev-bullseye && ./builder.sh

#### (jammy multiarch to Docker Hub)
cd $HOME/build/gridcoin-docker/grc-dev/grc-dev-jammy && ./builder.sh

#### (bookworm multiarch to Docker Hub)
cd $HOME/build/gridcoin-docker/grc-dev/grc-dev-bookworm && ./builder.sh

#### (noble multiarch to Docker Hub)
cd $HOME/build/gridcoin-docker/grc-dev/grc-dev-noble && ./builder.sh

#### (trixie multiarch to Docker Hub)
cd $HOME/build/gridcoin-docker/grc-dev/grc-dev-trixie && ./builder.sh


### Deprecated:
#### (bionic multiarch to Docker Hub)
cd $HOME/build/gridcoin-docker/grc-dev/grc-dev-bionic && ./builder.sh
#### (buster multiarch to Docker Hub)
cd $HOME/build/gridcoin-docker/grc-dev/grc-dev-buster && ./builder.sh

