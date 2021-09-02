#!/bin/bash

# Uncoment these lines to use Ubuntu with chroot, not PRoot

# sudo mount -t proc /proc /ubuntu-fs/proc

# sudo mount -o bind /sys /ubuntu-fs/sys

# sudo mount -o bind /dev /ubuntu-fs/dev

# sudo chroot /ubuntu-fs

proot -r /ubuntu-fs -0 -w / -b /dev -b /proc -b /sys /bin/sh
