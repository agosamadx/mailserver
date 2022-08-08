#!/bin/sh

./preprocess.sh

echo ${MAIL_DOMAIN} > /etc/mailname && newaliases

/usr/lib/postfix/configure-instance.sh
exec /usr/sbin/postfix start-fg
