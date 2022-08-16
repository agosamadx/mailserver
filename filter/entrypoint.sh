#!/bin/sh

./preprocess.sh

/usr/bin/freshclam --quiet
/usr/bin/sa-update
/usr/bin/sa-learn --spam /home/*/Maildir/.Junk/cur
/usr/bin/sa-learn --ham /home/*/Maildir/cur
/usr/bin/supervisord -c /etc/supervisor/supervisord.conf
