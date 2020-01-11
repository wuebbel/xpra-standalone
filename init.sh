#!/bin/bash
/usr/bin/xpra proxy --bind-tcp=*:14500 --daemon=no     --tcp-auth=sys     --ssl-cert=/etc/xpra/ssl-cert.pem --ssl=on     --bind=none --auth=sys --socket-dirs=/run/xpra --socket-permissions=666     --log-dir=/var/log --pidfile=/run/xpra.pid --debug=

# Could be running sssd and httpd here
#exec /usr/sbin/httpd -D FOREGROUND 
#/usr/sbin/httpd -D FOREGROUND 
# This cannot be reached if we exec.
sleep 1000000
