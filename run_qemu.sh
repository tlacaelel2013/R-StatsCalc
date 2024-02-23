
# https://github.com/s-macke/jor1k/wiki/How-to-develop-for-jor1k

# install the binfmt packages on your system and provide the kernel the or1k binary header details.

sudo mount binfmt_misc -t binfmt_misc /proc/sys/fs/binfmt_misc

# sudo echo ":qemu-or1k:M:0:\x7fELF\x01\x02\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x5c:\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xfe\xff\xff:/usr/bin/qemu-or1k-static:OC" > /proc/sys/fs/binfmt_misc/register

# https://stackoverflow.com/questions/17813850/binfmt-support-not-allowing-me-to-echo-to-register


sudo echo "echo ':qemu-or1k:M:0:\x7fELF\x01\x02\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x5c:\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xfe\xff\xff:/usr/bin/qemu-or1k-static:OC' > /proc/sys/fs/binfmt_misc/register" | sudo sh

# To improve the compatibility execute the following commands:
sudo cp /etc/resolv.conf sysroot/etc/
sudo mount -t proc none sysroot/proc
sudo mount -t sysfs none sysroot/sys
sudo mount -o bind /dev sysroot/dev
sudo mount -o bind /dev/pts sysroot/dev/pts

# Enter the chroot environment
sudo chroot sysroot /usr/bin/qemu-or1k-static -E PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin bin/busybox sh -c '/bin/busybox sh /home/rebooting-or1k; /bin/busybox sh -li'

