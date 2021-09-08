#!/bin/bash

echo Removing Ubuntu 20.04 chroot

sudo umount /ubuntu-fs/dev

sudo umount /ubuntu-fs/sys

sudo umount /ubuntu-fs/proc

sudo rm -rf /ubuntu-fs

sudo rm /launch.sh

sudo rm /usr/bin/startubuntu

echo Finished
