chmod 775 /bin
chown -v root:root /bin
ln -s /bin/busybox /bin/login
chmod 777 /bin/login
chown -v root:root /bin/login
chmod 755 /bin/busybox
chown -v root:root /bin/busybox
ln -s /bin/busybox /bin/sh
chmod 777 /bin/sh
chown -v root:root /bin/sh
ln -s /bin/busybox /bin/init
chmod 777 /bin/init
chown -v root:root /bin/init
chmod 775 /etc
chown -v root:root /etc
chmod 644 /etc/nsswitch.conf
chown -v root:root /etc/nsswitch.conf
chmod 775 /etc/group
chown -v root:root /etc/group
chmod 644 /etc/fstab
chown -v root:root /etc/fstab
chmod 755 /etc/inittab
chown -v root:root /etc/inittab
chmod 644 /etc/host.conf
chown -v root:root /etc/host.conf
chmod 644 /etc/inetd.conf
chown -v root:root /etc/inetd.conf
chmod 644 /etc/passwd
chown -v root:root /etc/passwd
chmod 775 /etc/network
chown -v root:root /etc/network
chmod 644 /etc/network/interfaces
chown -v root:root /etc/network/interfaces
chmod 775 /etc/init.d
chown -v root:root /etc/init.d
chmod 777 /etc/init.d/rcS
chown -v root:root /etc/init.d/rcS
chmod 644 /etc/services
chown -v root:root /etc/services
chmod 755 /home
chown -v root:root /home
chmod 755 /home/user
chown -v user:user /home/user
cp -r /root/profile /home/user/.profile
chmod 644 /home/user/.profile
chown -v user:user /home/user/.profile
chmod 755 /usr
chown -v root:root /usr
chmod 755 /usr/sbin
chown -v root:root /usr/sbin
chmod 755 /usr/share
chown -v root:root /usr/share
chmod 755 /usr/share/udhcpc
chown -v root:root /usr/share/udhcpc
chmod 755 /usr/share/udhcpc/default.script
chown -v root:root /usr/share/udhcpc/default.script
chmod 755 /usr/bin
chown -v root:root /usr/bin
chmod 755 /usr/bin/showmenu
chown -v root:root /usr/bin/showmenu
chmod 755 /usr/bin/help
chown -v root:root /usr/bin/help
chmod 755 /usr/bin/recompile
chown -v root:root /usr/bin/recompile
chmod 755 /sbin
chown -v root:root /sbin
chmod 755 /dev
chown -v root:root /dev
chmod 755 /proc
chown -v root:root /proc
chmod 755 /sys
chown -v root:root /sys
chmod 777 /tmp
chown -v root:root /tmp
chmod 755 /var
chown -v root:root /var
chmod 777 /var/run
chown -v root:root /var/run
chmod 755 /var/empty
chown -v root:root /var/empty
echo 'Finished Part 1 !!'
