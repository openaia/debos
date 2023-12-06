# OpenAIA Debos

Build instruction for OpenAIA Debos image in docker container.

## Clone source

```
$ mkdir debos-openaia && cd debos-openaia
$ git clone git@github.com:openaia/debos.git
```

## Build OpenAIA

Install the [docker](https://docs.docker.com/engine/install/ubuntu/) at host.

Build OpenAIA for 6TOPS,
```
$ cd debos
$ ./download-artifacts.sh
$ docker run -ti --privileged --net host -v `pwd`:/home/build/shared -w /home/build/shared ghcr.io/openaia/easy-build/build-debos:bookworm-v0.1 sudo debos --memory=4Gb -t imgname:6tops recipe.yaml
```

## Program

We can program microSD or eMMC, assume /dev/sdX is microSD detected in host,
```
$ sudo bmaptool copy --bmap openaia-bullseye-6tops.bmap openaia-bullseye-6tops.img.gz /dev/sdX
```
