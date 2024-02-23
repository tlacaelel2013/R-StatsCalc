cd /home
/bin/busybox ln -s /bin/busybox /bin/ln
/bin/busybox ln -s /bin/busybox /bin/ls
/bin/busybox ln -s /bin/busybox /bin/chmod
/bin/busybox ln -s /bin/busybox /bin/chown
/bin/busybox ln -s /bin/busybox /bin/cp

# /bin/busybox sh create_busybox_links.sh
/bin/busybox sh basefs-links.sh
/bin/busybox sh fs-links.sh

# /bin/rm *.sh
# rm *.log?
echo "_____________________________________"
echo ""
echo "             OpenRISC 1000           "
echo " Your system       or      is ready!!"
echo "             RISC-V 32-bit           "
echo "_____________________________________"
echo ""
echo ""
echo " For more info go to github.com/tlacaelel2013"

