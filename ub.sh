#!/bin/bash

echo Creating Ubuntu chroot environment

cd ~/

sudo mkdir ubuntu-fs

ARCHITECTURE=$(dpkg --print-architecture)

cd ubuntu-fs

sudo wget http://cdimage.ubuntu.com/ubuntu-base/releases/21.04/release/ubuntu-base-21.04-base-$ARCHITECTURE.tar.gz

HIRSUTE=ubuntu-base-21.04-base-$ARCHITECTURE.tar.gz

sudo tar -xzf $HIRSUTE

sudo rm -rf $HIRSUTE

echo Writing launch script

sudo rm -rf ~/ubuntu-fs/etc/resolv.conf

sudo cp /etc/resolv.conf ~/ubuntu-fs/etc

cd ~/

sudo touch startubuntu.sh

echo sudo mount -t proc /proc ~/ubuntu-fs/proc >> ~/startubuntu.sh

echo sudo mount -o bind /sys ~/ubuntu-fs/sys >> ~/startubuntu.sh

echo sudo mount -o bind /dev ~/ubuntu-fs/dev >> ~/startubuntu.sh

echo sudo mount --make-rslave ~/ubuntu-fs/sys >> ~/startubuntu.sh

echo sudo mount --make-rslave ~/ubuntu-fs/dev >> ~/startubuntu.sh

echo sudo chroot ~/ubuntu-fs >> ~/startubuntu.sh



echo Finished. Start Ubuntu Chroot with sudo bash ub.sh
