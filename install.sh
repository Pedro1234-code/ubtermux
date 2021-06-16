#!/bin/bash

echo Creating Ubuntu chroot environment

cd /

sudo mkdir ubuntu-fs

ARCHITECTURE=$(dpkg --print-architecture)

cd ubuntu-fs

sudo wget http://cdimage.ubuntu.com/ubuntu-base/releases/21.04/release/ubuntu-base-21.04-base-$ARCHITECTURE.tar.gz

HIRSUTE=ubuntu-base-21.04-base-$ARCHITECTURE.tar.gz

sudo tar -xzf $HIRSUTE

sudo rm -rf $HIRSUTE

echo Writing launch script

sudo rm -rf /ubuntu-fs/etc/resolv.conf

sudo cp /etc/resolv.conf /ubuntu-fs/etc

cd /

sudo wget https://raw.githubusercontent.com/Pedro1234-code/ubuntu-chroot/main/launch.sh

sudo touch startubuntu

echo #!/bin/bash >> startubuntu

echo sudo bash /launch.sh >> /startubuntu

sudo cp launch.sh /home/

sudo cp startubuntu /usr/bin

echo Finished. Start Ubuntu Chroot with sudo bash /home/launch.sh
