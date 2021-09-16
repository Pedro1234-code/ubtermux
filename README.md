# ubuntu-chroot

What is chroot?

"chroot" is a way to change the / folder to another one.

For example: I have a system inside /dev/sda1, but the grub bootloader is broken, so I boot into a Linux live cd and chroot into it to acess my operating system installed at /dev/sda1.

How to chroot into my system and recover grub?

Simple. First you need to mount /dev/sda1 to /mnt:

$ sudo mount /dev/sda1 /mnt

Now, mount your /dev, /proc and /sys to the chroot folder.

$ sudo mount -t proc /proc /mnt/proc

$ sudo mount -o bind /sys /mnt/sys

$ sudo mount -o bind /dev /mnt/dev

Now, you are good to go.

$ sudo chroot /mnt

And now, you can simple do update-grub

# update-grub

# exit

And now, just type sudo reboot.
