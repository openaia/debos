# Build OpenAIA

Below is the instructions of how to build openaia image at docker host.

## Pull docker-container

Install the [docker](https://docs.docker.com/engine/install/ubuntu/) and it is recommended to use associated docker image that openaia required.

```
$ docker pull ghcr.io/edgeble/easy-build/build-debos:bullseye
```

Run the docker with your workspace path,
```
$ docker run -ti --privileged --net host --volume=<path/to/workspace>:/home/build/shared ghcr.io/edgeble/easy-build/build-debos:bullseye
```

## Build debos

All steps here are inside docker-container
```
build@myhost:~$ cd shared
build@myhost:~$ mkdir debos-bsp && cd debos-bsp
build@myhost:~$ git clone git@github.com:openaia/debos.git
```

Build the openaia,
```
build@myhost:~$ cd debos
build@myhost:~$ ./build.sh
```

For custom artifacts, build the [kernel and u-boot](https://gitlab.com/edgeble-neural-compute-module/debos/-/blob/main/README-kernel.md?ref_type=heads) and then add prebuilt directory with all binaries and deb files like below structure.
```
prebuilt/
prebuilt/idbloader.img
prebuilt/u-boot.itb
prebuilt/linux
prebuilt/linux/linux-image-5.10.110-1-rockchip-g8e20070fcaf5_5.10.110-1-rockchip_arm64.deb
prebuilt/linux/linux-libc-dev_5.10.110-1-rockchip_arm64.deb
prebuilt/linux/linux-image-5.10.110-1-rockchip-g8e20070fcaf5-dbg_5.10.110-1-rockchip_arm64.deb
prebuilt/linux/linux-headers-5.10.110-1-rockchip-g8e20070fcaf5_5.10.110-1-rockchip_arm64.deb
prebuilt/linux/linux-5.10.110-1-rockchip-g8e20070fcaf5_5.10.110-1-rockchip_arm64.changes
```

With custom arifacts, add --custom-artifacts flag while running build.sh.

## Program

But make sure to copy kernel deb and u-boot images in overlay/packages directory.

We can program microSD or eMMC, assume /dev/sdX is microSD detected in host,
```
$ sudo bmaptool copy --bmap openaia-neu6b-io-bullseye.bmap openaia-neu6b-io-bullseye.img /dev/sdX
```
