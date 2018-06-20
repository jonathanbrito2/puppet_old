#!/bin/bash

#for a in /var/adm/* /var/log/*
#do
# 
#[ -f $a ] && chmod -R 640 $a
#
#[ -d $a ] && chmod -R 750 $a
#
#done

find /etc -type f -exec chmod og-w {} \;
find /var/log -type f -exec chmod 640 {} \;
find /var/log -type d -exec chmod 750 {} \;
find /var/adm -type f -exec chmod 640 {} \;
find /var/adm -type d -exec chmod 750 {} \;
find /var/log/ocsinventory-agent -type f -exec chmod 640 {} \;
chmod 755 /var/log 
chmod 750 /usr/bin/gcc
chmod og-w /etc/pcp/nssdb

/usr/bin/chmod -s /usr/bin/at
/usr/bin/chmod -s /usr/bin/fusermount
/usr/bin/chmod -s /usr/bin/ssh-agent
/usr/bin/chmod -s /usr/bin/staprun
/usr/bin/chmod -s /usr/bin/write
/usr/bin/chmod -s /usr/bin/Xorg
/usr/bin/chmod -s /usr/sbin/mount.nfs
/usr/bin/chmod -s /usr/sbin/netreport
/usr/bin/chmod -s /usr/sbin/pam_timestamp_check
/usr/bin/chmod -s /usr/sbin/postdrop
/usr/bin/chmod -s /usr/sbin/postqueue
/usr/bin/chmod -s /usr/sbin/unix_chkpwd
/usr/bin/chmod -s /usr/sbin/usernetctl
/usr/bin/chmod -s /usr/bin/chfn
/usr/bin/chmod -s /usr/bin/chsh
/usr/bin/chmod -s /usr/bin/crontab
/usr/bin/chmod -s /usr/bin/mount
/usr/bin/chmod -s /usr/bin/passwd
/usr/bin/chmod -s /usr/bin/pkexec
/usr/bin/chmod -s /usr/bin/su
/usr/bin/chmod -s /usr/bin/umount
/usr/bin/chmod -s /usr/bin/cgclassify
/usr/bin/chmod -s /usr/bin/cgexec
/usr/bin/chmod -s /usr/bin/chage
/usr/bin/chmod -s /usr/bin/gpasswd
/usr/bin/chmod -s /usr/bin/ksu
/usr/bin/chmod -s /usr/bin/locate
/usr/bin/chmod -s /usr/bin/newgrp


# DESABILITA SERVICOS DO CHKCONFIG

#systemctl stop bab_RHEL
#systemctl disable bab_RHEL

