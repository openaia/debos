#!/bin/sh
#
# Install package from Debian experimental
#
# TODO propose following syntax to Debos:
#- action: apt
#  description: Install u-boot-rockchip from experimental
#  suite: experimental
#  packages:
#    - u-boot-rockchip
#

set -eu

export DEBIAN_FRONTEND=noninteractive

PACKAGE=$1
echo "I: Installing $PACKAGE from experimental"

# Add experimental apt sources
if [ ! -f "/etc/apt/sources.list.d/experimental.list" ] ; then
    echo "I: Adding experimental apt sources"
    echo "deb https://deb.debian.org/debian experimental main" > /etc/apt/sources.list.d/experimental.list
fi

# Update apt sources
apt-get update

# Install package from experimental suite
apt-get install -y --no-install-recommends \
                -t experimental $PACKAGE
