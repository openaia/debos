#!/bin/sh

if [ -d "prebuilt" ] ; then
    echo "ERROR: prebuilt directory exists. Please remove it before running this script."
    exit 1
fi

# u-boot
U_BOOT_REL="ncm6b-v2023.11"
mkdir -p prebuilt
echo "=== Downloading u-boot artifacts ==="
wget --no-verbose --show-progress -P prebuilt "https://github.com/openaia/u-boot/releases/download/$U_BOOT_REL/idbloader.img"
wget --no-verbose --show-progress -P prebuilt "https://github.com/openaia/u-boot/releases/download/$U_BOOT_REL/u-boot.itb"

# linux
KERNEL_REL="v2023.11-6TOPS"
echo "=== Downloading linux artifacts ==="
wget --no-verbose --show-progress -P prebuilt "https://github.com/openaia/kernel/releases/download/$KERNEL_REL/linux.tar.xz"
tar xvf prebuilt/linux.tar.xz -C prebuilt
rm -rf prebuilt/linux.tar.xz

# modules
echo "=== Downloading modules artifacts ==="
wget --no-verbose --show-progress -P prebuilt "https://github.com/openaia/kernel/releases/download/$KERNEL_REL/modules.tar.xz"
tar xvf prebuilt/modules.tar.xz -C prebuilt
rm -rf prebuilt/modules.tar.xz

find prebuilt/
echo "=== Remember to remove prebuilt directory for new aritfacts to load ==="
