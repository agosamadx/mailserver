#!/bin/sh

./preprocess.sh

/usr/bin/supervisord -c /etc/supervisor/supervisord.conf
while true
do
  sleep 86400
  postfix reload
  dovecot reload
done
