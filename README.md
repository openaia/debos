# OpenAIA Debos

Build instruction for OpenAIA Debos image in docker container.

## Clone source

```
$ mkdir debos-openaia && cd debos-openaia
$ git clone git@github.com:edgeble/debos.git
```

## Build OpenAIA

Install the [docker](https://docs.docker.com/engine/install/ubuntu/) at host.

Build OpenAIA for 6TOPS,
```
$ cd debos
$ ./download-artifacts.sh
$ docker run -ti --privileged --net host -v `pwd`:/home/build/shared -w /home/build/shared ghcr.io/edgeble/easy-dock/debian:bookworm-v1 sudo debos --memory=4Gb -t imgname:6tops recipe.yaml
```

## Program

We can program microSD or eMMC, assume /dev/sdX is microSD detected in host,
```
$ sudo bmaptool copy --bmap openaia-bullseye-6tops.bmap openaia-bullseye-6tops.img.gz /dev/sdX
```
