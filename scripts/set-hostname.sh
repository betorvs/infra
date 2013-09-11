#!/bin/bash

# user-data
# hostname=your-hostname
# Replace this with your domain
#DOMAIN=domain.com

USER_DATA=`/usr/bin/curl -s http://169.254.169.254/latest/user-data| grep hostname | sed 's/.*=//' | sed 's/ //'`
HOSTNAME=`echo $USER_DATA`
IPV4=`/usr/bin/curl -s http://169.254.169.254/latest/meta-data/public-ipv4`

# Set the host name
hostname $HOSTNAME
SHORTNAME=`hostname -s`
echo $HOSTNAME > /etc/hostname

# Add fqdn to hosts file
cat<<EOF > /etc/hosts
# This file is automatically genreated by ec2-hostname script
127.0.0.1 localhost
$IPV4 $HOSTNAME $SHORTNAME

# The following lines are desirable for IPv6 capable hosts
::1 ip6-localhost ip6-loopback
fe00::0 ip6-localnet
ff00::0 ip6-mcastprefix
ff02::1 ip6-allnodes
ff02::2 ip6-allrouters
ff02::3 ip6-allhosts
EOF
