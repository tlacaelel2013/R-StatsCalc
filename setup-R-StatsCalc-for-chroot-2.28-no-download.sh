# Create a directory
mkdir or1k-system
cd or1k-system

# Download jor1k sysroot
###  wget https://github.com/s-macke/jor1k-sysroot/archive/4c4219592a7ea3c9c8510ec00801c24c01f25cc0.tar.gz
# The following files are needed to build the app for web browsers 
# wget https://github.com/s-macke/riscv-sysroot/archive/cc6056efb82ef68b88f1d9f28bd5f63184e7e413.tar.gz
# wget https://github.com/s-macke/jor1k/archive/refs/heads/master.tar.gz

# Decompress the directories
###  tar -xvf 4c4219592a7ea3c9c8510ec00801c24c01f25cc0.tar.gz

# Prepare directory for chroot
mkdir sysroot
cp -r ../iOS/R-StatsCalc/jor1k/openrisc-sys/basefs/* sysroot/
cp -r ../iOS/R-StatsCalc/jor1k/openrisc-sys/fs/* sysroot/
### cp -R jor1k-sysroot-4c4219592a7ea3c9c8510ec00801c24c01f25cc0/basefs/bin sysroot/
### cp -R jor1k-sysroot-4c4219592a7ea3c9c8510ec00801c24c01f25cc0/basefs/etc sysroot/
### cp -R jor1k-sysroot-4c4219592a7ea3c9c8510ec00801c24c01f25cc0/basefs/root sysroot/
### cp -R jor1k-sysroot-4c4219592a7ea3c9c8510ec00801c24c01f25cc0/basefs/usr sysroot/
### cp -R jor1k-sysroot-4c4219592a7ea3c9c8510ec00801c24c01f25cc0/fs/etc sysroot/
### cp -R jor1k-sysroot-4c4219592a7ea3c9c8510ec00801c24c01f25cc0/fs/home sysroot/
### cp -R jor1k-sysroot-4c4219592a7ea3c9c8510ec00801c24c01f25cc0/fs/lib sysroot/
### cp -R jor1k-sysroot-4c4219592a7ea3c9c8510ec00801c24c01f25cc0/fs/root sysroot/
### cp -R jor1k-sysroot-4c4219592a7ea3c9c8510ec00801c24c01f25cc0/fs/sbin sysroot/
### cp -R jor1k-sysroot-4c4219592a7ea3c9c8510ec00801c24c01f25cc0/fs/usr sysroot/
### cp -R jor1k-sysroot-4c4219592a7ea3c9c8510ec00801c24c01f25cc0/fs/var sysroot/

#### mv sysroot-NO-LINKS sysroot
## Decompress sysroot files: sysroot-fs1.tar.bz2 and sysroot-fs2.tar.bz2
# tar -xjvf sysroot-fs1A.tar.bz2
# tar -xjvf sysroot-fs1B.tar.bz2
# tar -xjvf sysroot-fs2A.tar.bz2
# tar -xjvf sysroot-fs2B.tar.bz2
# tar -xjvf sysroot-fs2C.tar.bz2
# tar -xjvf sysroot-fs2D.tar.bz2

## Prepare the filesystem
cd sysroot
find . -name "*.bz2" -exec bunzip2 {} \;
# ln -s bin/busybox bin/login
# ln -s bin/busybox bin/sh
# ln -s bin/busybox bin/init
# ln -s bin/busybox bin/ln
mkdir proc
mkdir sys
mkdir dev
mkdir dev/pts
mkdir tmp
mkdir -p var/run
mkdir -p usr/local/bin
mkdir home
  
cd ..
# there are new versions of qemu-or1k-static
# download qemu-or1k-static to sysroot/usr/bin

# wget https://github.com/multiarch/qemu-user-static/releases/download/v2.12.0/qemu-or1k-static -O sysroot/usr/bin/qemu-or1k-static

# wget http://github.com/multiarch/qemu-user-static/releases/download/v7.1.0-2/qemu-or1k-static -O sysroot/usr/bin/qemu-or1k-static
cp ../qemu-or1k-static sysroot/usr/bin/
chmod u+x sysroot/usr/bin/qemu-or1k-static


# getting to original working directory
cd ..

# Copy scripts to home for the user to complete setup during chroot
# cp create_busybox_links.sh jor1k-systems-2023/sysroot/home/
#### cp jor1k-symlinks1.sh jor1k-systems-2023/sysroot/home/
#### cp jor1k-symlinks2.sh jor1k-systems-2023/sysroot/home/
# cp rmlinks.sh jor1k-systems-2023/sysroot/home/
#### cp jor1k-srclinks1.sh jor1k-systems-2023/sysroot/home/
#### cp jor1k-srclinks2.sh jor1k-systems-2023/sysroot/home/
#### cp jor1k-chmod1.sh jor1k-systems-2023/sysroot/home/
#### cp jor1k-chmod2.sh jor1k-systems-2023/sysroot/home/
cp setup-3.0.sh or1k-system/sysroot/home/

# Create sh files by using NODE for link generation
cp iOS/R-StatsCalc/jor1k/openrisc-sys/basefs.json input/
cp iOS/R-StatsCalc/jor1k/openrisc-sys/fs.json input/
node basefs-links-3.0.js
node fs-links-3.0.js
cp output/*.sh or1k-system/sysroot/home/

# Move scripts to or1k-system for the user to run qemu
cp run_qemu.sh or1k-system/
cp run_qemu2.sh or1k-system/
cp rebooting-or1k or1k-system/sysroot/home/

# cd or1k-system
chmod 777 or1k-system/sysroot/bin/busybox
chmod 777 or1k-system/sysroot/home/rebooting-or1k
echo ""
echo "______________________________________________________________________"
echo ""
echo "or1k sysroot is ready for chroot (R-StatsCalc version)"
echo " "
echo "[0] type in: cd or1k-system to enter chroot dirctory"
echo "[1] type in: ls  (to verify that sysroot is in the current directory)"
echo "[2] type in: /bin/sh ./run_qemu.sh (to enter or1k terminal)"
echo "[3] enter: Ctrl-D (to leave the system if needed)"
echo "[4] type in: /bin/sh ./run_qemu2.sh (to re-enter the system)"
echo "[5] to finish the setup, follow the next steps: "
echo "On the or1k terminal type in:"
echo " __________________________________"
echo ""
echo " /bin/busybox sh /home/setup-3.0.sh"
echo " __________________________________"
echo ""
echo " echo *"
echo "______________________________________________________________________"




