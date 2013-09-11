#!/bin/bash

YUM="/usr/bin/yum"
RESIZE="/sbin/resize2fs"
KERNEL=`uname -r`
DEV=`grep $KERNEL /boot/grub/grub.conf |grep root|awk '{print \$3}'|sed 's/.*=//'`
#SIZE="30G"
USER_DATA=`/usr/bin/curl -s http://169.254.169.254/latest/user-data| grep rootsize | sed 's/.*=//' | sed 's/ //'`
SIZE=`echo $USER_DATA`

$RESIZE $DEV $SIZE && echo "resize OK"
$YUM -y update && echo "UPDATE OK"
$YUM -y install wget && echo "wget OK"


