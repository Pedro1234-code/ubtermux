#!/bin/bash

echo Creating Ubuntu chroot environment

sudo apt install proot -y

sudo dnf install proot

sudo apk add proot

cd /

sudo mkdir ubuntu-fs

ARCHITECTURE=$(dpkg --print-architecture)

cd ubuntu-fs

# Change the Ubuntu version here. This script does not support installation of Ubuntu versions launched before 2016 LTS. To install Ubuntu 16.04, put 16.04.6, not only 16.04. To install 18.04, put 18.04.5.
ubuntu_version=focal

sudo wget https://cloud-images.ubuntu.com/focal/current/focal-server-cloudimg-$ARCHITECTURE-wsl.rootfs.tar.gz

ubuntu=focal-server-cloudimg-$ARCHITECTURE-wsl.rootfs.tar.gz

sudo tar -xzf $ubuntu

sudo rm -rf $ubuntu

echo Writing launch script

sudo rm -rf /ubuntu-fs/etc/resolv.conf

sudo cp /etc/resolv.conf /ubuntu-fs/etc

cd /

sudo wget https://raw.githubusercontent.com/Pedro1234-code/ubuntu-chroot/main/launch.sh

sudo touch startubuntu

echo #!/bin/bash >> startubuntu

echo sudo bash /launch.sh > /startubuntu

sudo cp launch.sh /home/

sudo cp startubuntu /usr/bin

sudo chmod +x /usr/bin/startubuntu

echo Installing things inside Ubuntu Chroot

sudo chroot /ubuntu-fs apt update

sudo chroot /ubuntu-fs apt upgrade -y

sudo chroot /ubuntu-fs apt install nano vim sudo python wget gnupg apt-utils ubuntu-release-upgrader-core -y

echo Finished. Start Ubuntu Chroot with sudo startubuntu
