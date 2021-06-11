#!/bin/bash

echo Removing Ubuntu 21.04 chroot

sudo umount /ubuntu-fs/dev

sudo umount /ubuntu-fs/sys

sudo umount /ubuntu-fs/proc

sudo rm -rf /ubuntu-fs

echo Finished
