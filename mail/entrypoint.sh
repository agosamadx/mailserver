#!/bin/sh

./preprocess.sh

/usr/bin/supervisord -c /etc/supervisor/supervisord.conf
