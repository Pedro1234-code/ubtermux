#!/bin/bash

cd ~/

mkdir ubuntu-fs

cd ubuntu-fs

wget http://cdimage.ubuntu.com/ubuntu-base/releases/20.04/release/ubuntu-base-20.04.1-base-amd64.tar.gz

FOCAL=ubuntu-base-20.04.1-base-amd64.tar.gz

tar -xzf $FOCAL

echo Writing launch script

cd ~/

touch startubuntu.sh

echo mount -t proc /proc ~/ubuntu-fs/proc >> ~/startubuntu.sh

echo mount -o bind /sys ~/ubuntu-fs/sys >> ~/startubuntu.sh

echo mount -o bind /dev ~/ubuntu-fs/dev >> ~/startubuntu.sh

echo mount --make-rslave ~/ubuntu-fs/sys

echo mount --make-rslave ~/ubuntu-fs/dev

echo Finished. Start Ubuntu Chroot with sudo bash ub.sh
