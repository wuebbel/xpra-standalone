#!/bin/bash
cd $HOME
date >last_startup
mkdir /run/sshd

#yum update -y

# Choose your weapons. We might/should add some here.
# There is an option to disable the httpd.
if test "$START_SSHD" = "yes"; then
/usr/sbin/sshd
fi
if test "$START_SSSD" = "yes"; then
/sssd/sssd
fi
if test "$START_SYSLOG" = "yes"; then
rsyslogd
fi
sleep 5

/usr/bin/xpra proxy --bind-tcp=*:14500 --daemon=no     --tcp-auth=sys     --ssl-cert=/etc/xpra/ssl-cert.pem --ssl=on     --bind=none --auth=sys --socket-dirs=/run/xpra --socket-permissions=666     --log-dir=/var/log --pidfile=/run/xpra.pid --debug=platform 

# Could be running sssd and httpd here
#exec /usr/sbin/httpd -D FOREGROUND 
#/usr/sbin/httpd -D FOREGROUND 
# This cannot be reached if we exec.
sleep 1000000
