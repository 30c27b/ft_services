#!/bin/ash

telegraf &

/usr/sbin/pure-ftpd -Y 2 -p 30000:30004 -P $EXTERNAL_IP
