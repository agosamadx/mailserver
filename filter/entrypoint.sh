#!/bin/sh

./preprocess.sh

/usr/bin/freshclam
/usr/bin/sa-update
/usr/bin/sa-learn --spam /home/virtual/*/*/Maildir/.Junk/cur &
/usr/bin/sa-learn --ham /home/virtual/*/*/Maildir/cur &
/usr/bin/supervisord -c /etc/supervisor/supervisord.conf
