# Build Kernel

## Get the source code

You need Git to get multiple git repositories to build the image.

Install Git if you don't have it.

```
$ sudo apt-get update
$ sudo apt-get install git
```

Clone the source code

```
$ mkdir ~/rock-sdk && cd ~/rock-sdk
$ git clone -b next-dev git@gitlab.com:edgeble-neural-compute-module/u-boot.git
$ git clone -b linux-5.10-gen-rkr3.4 git@gitlab.com:edgeble-neural-compute-module/kernel.git
$ git clone -b main git@gitlab.com:edgeble-neural-compute-module/rkbin.git
$ git clone -b main git@gitlab.com:edgeble-neural-compute-module/build.git
```

For neu6b-v1
```
cd ~/rock-sdk/kernel
$ git checkout 69e10e1fe0693f8cdcf106760ea867b0ddbb131c
```

And you will get

```
build  debos  kernel  packages  rkbin  u-boot
```

Directories usage introductions:

* build:
    * Some script files and configuration files for building u-boot, kernel and rootfs.
* debos:
    * Build OS
* kernel:
    * Kernel source code, current version is 5.10.160.
* packages:
    * Prebuilt packages.
* rkbin:
    * Prebuilt Rockchip binaries, include first stage loader and ATF(Arm Trustzone Firmware).
* u-boot:
    * U-Boot as the second stage bootloader

## Install toolchain

```
$ mkdir ~/rock-sdk/toolchain && cd ~/rock-sdk/toolchain
$ wget https://dl.radxa.com/tools/linux/gcc-arm-10.3-2021.07-x86_64-aarch64-none-linux-gnu.tar.gz
$ sudo tar zxvf gcc-arm-10.3-2021.07-x86_64-aarch64-none-linux-gnu.tar.gz -C /usr/local/
```

Add the following line to the end of file ~/.bashrc

```
export PATH="/usr/local/gcc-arm-10.3-2021.07-x86_64-aarch64-none-linux-gnu/linux-x86/aarch64/gcc-arm-10.3-2021.07-x86_64-aarch64-none-linux-gnu/bin:$PATH"
```

And source ~/.bashrc

```
$ source ~/.bashrc
```

Check the version of toolchain

```
$ which aarch64-none-linux-gnu-gcc
/usr/local/gcc-arm-10.3-2021.07-x86_64-aarch64-none-linux-gnu/linux-x86/aarch64/gcc-arm-10.3-2021.07-x86_64-aarch64-none-linux-gnu/bin/aarch64-none-linux-gnu-gcc

$ aarch64-none-linux-gnu-gcc -v
Using built-in specs.
COLLECT_GCC=aarch64-none-linux-gnu-gcc
COLLECT_LTO_WRAPPER=/usr/local/gcc-arm-10.3-2021.07-x86_64-aarch64-none-linux-gnu/linux-x86/aarch64/gcc-arm-10.3-2021.07-x86_64-aarch64-none-linux-gnu/bin/../libexec/gcc/aarch64-none-linux-gnu/10.3.1/lto-wrapper
Target: aarch64-none-linux-gnu
Configured with: /data/jenkins/workspace/GNU-toolchain/arm-10/src/gcc/configure --target=aarch64-none-linux-gnu --prefix= --with-sysroot=/aarch64-none-linux-gnu/libc --with-build-sysroot=/data/jenkins/workspace/GNU-toolchain/arm-10/build-aarch64-none-linux-gnu/install//aarch64-none-linux-gnu/libc --with-bugurl=https://bugs.linaro.org/ --enable-gnu-indirect-function --enable-shared --disable-libssp --disable-libmudflap --enable-checking=release --enable-languages=c,c++,fortran --with-gmp=/data/jenkins/workspace/GNU-toolchain/arm-10/build-aarch64-none-linux-gnu/host-tools --with-mpfr=/data/jenkins/workspace/GNU-toolchain/arm-10/build-aarch64-none-linux-gnu/host-tools --with-mpc=/data/jenkins/workspace/GNU-toolchain/arm-10/build-aarch64-none-linux-gnu/host-tools --with-isl=/data/jenkins/workspace/GNU-toolchain/arm-10/build-aarch64-none-linux-gnu/host-tools --enable-fix-cortex-a53-843419 --with-pkgversion='GNU Toolchain for the A-profile Architecture 10.3-2021.07 (arm-10.29)'
Thread model: posix
Supported LTO compression algorithms: zlib
gcc version 10.3.1 20210621 (GNU Toolchain for the A-profile Architecture 10.3-2021.07 (arm-10.29))
```

## Install other build tools

```
$ sudo apt-get install gcc-aarch64-linux-gnu device-tree-compiler libncurses5 libncurses5-dev build-essential libssl-dev mtools debos gem bc python dosfstools ruby-dev build-essential
$ sudo gem install fpm
```

If it appears that it cannot be installed. You can try the following method

```
$ sudo apt-get install aptitude 
$ sudo aptitude install bc
```

## Build U-Boot

```
$ cd ~/rock-sdk
$ ./build/mk-uboot.sh rk3588-edgeble-neu6b-io
```

The generated images will be copied to out/u-boot directory.

```
$ tree out/u-boot/
out/u-boot/
├── idbloader.img
├── rk3588_spl_loader_v1.07.111.bin
├── spi
│   └── spi_image.img
└── u-boot.itb

1 directory, 4 files
```

## Pack U-Boot

```
$ cd ~/rock-sdk
$ ./build/pack-uboot.sh -b neu6b-io
```

The generated package will be copied to out/packages directory.

```
$ ls  out/packages/neu6b-io*
```

## Build kernel

Build kernel with default rockchip_linux_defconfig.

```
$ cd ~/rock-sdk
$ ./build/mk-kernel.sh rk3588-edgeble-neu6b-io
```

Change kernel config

Optionally, if you want to change the default kernel config.

```
$ cd ~/rock-sdk/kernel
$ export ARCH=arm64
$ export CROSS_COMPILE=aarch64-none-linux-gnu-
$ make rockchip_linux_defconfig
$ make menuconfig
$ make savedefconfig
$ cp defconfig arch/arm64/configs/rockchip_linux_defconfig
$ $ cd ..
$ ./build/mk-kernel.sh neu6b-io
```

You will get the kernel image and dtb file

```
$ tree out/kernel/
out/kernel/
├── Image
└── rk3588-edgeble-neu6b-io.dtb

0 directories, 2 files
```

## Pack Kernel

```
$ cd ~/rock-sdk
$ ./build/pack-kernel.sh -d  rockchip_linux_defconfig -r 1
```

The generated packages will be copied to out/packages directory.

```
$ ls out/packages/linux*.deb
```
