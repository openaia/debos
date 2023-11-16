# Build OpenAIA

Below is the instructions of how to build openaia image at docker host.

## Pull docker-container

Install the [docker](https://docs.docker.com/engine/install/ubuntu/) and it is recommended to use associated docker image that openaia required.

```
$ docker pull ghcr.io/openaia/easy-build/build-debos:bookworm
```

Run the docker with your workspace path,
```
$ docker run -ti --privileged --net host -v <path/to/workspace>:/home/build/shared -w /home/build/shared ghcr.io/openaia/easy-build/build-debos:bookworm
```

## Build debos

All steps here are inside docker-container
```
build@myhost:~$ mkdir debos-openaia && cd debos-openaia
build@myhost:~$ git clone git@github.com:openaia/debos.git
```

Build the openaia for 6TOPS,
```
build@myhost:~$ cd debos && ./download-artifacts.sh
build@myhost:~$ sudo debos --memory=4Gb -t imgname:6top recipe.yaml
```

## Program

But make sure to copy kernel deb and u-boot images in overlay/packages directory.

We can program microSD or eMMC, assume /dev/sdX is microSD detected in host,
```
$ sudo bmaptool copy --bmap openaia-neu6b-io-bullseye.bmap openaia-neu6b-io-bullseye.img.gz /dev/sdX
```
