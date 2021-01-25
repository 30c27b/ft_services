#!/bin/ash

/usr/sbin/sshd

nginx -g 'pid /run/nginx/nginx.pid; daemon off;'
