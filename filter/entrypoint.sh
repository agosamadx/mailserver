#!/bin/sh

./preprocess.sh

/usr/bin/freshclam
/usr/bin/sa-update
/usr/bin/sa-learn --dbpath /var/lib/amavis/.spamassassin --spam /home/virtual/*/*/Maildir/.Junk/cur
/usr/bin/sa-learn --dbpath /var/lib/amavis/.spamassassin --ham /home/virtual/*/*/Maildir/cur
/usr/bin/supervisord -c /etc/supervisor/supervisord.conf
