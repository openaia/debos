#!/bin/sh

MYUSER=open

adduser --gecos $MYUSER \
  --disabled-password \
  --shell /bin/bash \
  $MYUSER

adduser "$MYUSER" audio
adduser "$MYUSER" sudo
adduser "$MYUSER" video

echo "$MYUSER:$MYUSER" | chpasswd
