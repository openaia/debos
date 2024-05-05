#!/bin/sh

MYUSER=open
MYHOST=$1

adduser --gecos $MYUSER \
  --disabled-password \
  --shell /bin/bash \
  $MYUSER

adduser "$MYUSER" audio
adduser "$MYUSER" sudo
adduser "$MYUSER" video

echo "$MYUSER:$MYUSER" | chpasswd

echo $MYHOST > /etc/hostname
sed -i "s/hostname/$MYHOST/g" /etc/hosts
