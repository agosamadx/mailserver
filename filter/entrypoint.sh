#!/bin/sh

./preprocess.sh

/usr/bin/freshclam --quiet
/usr/bin/sa-update
/usr/bin/supervisord -c /etc/supervisor/supervisord.conf
