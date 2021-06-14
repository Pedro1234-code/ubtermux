#!/bin/bash

sudo mount -t proc /proc /ubuntu-fs/proc

sudo mount -o bind /sys /ubuntu-fs/sys

sudo mount -o bind /dev /mnt/server/dev

sudo chroot /ubuntu-fs
