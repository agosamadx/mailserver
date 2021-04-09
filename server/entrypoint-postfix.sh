#!/bin/sh

./preprocess.sh

echo ${MAIL_DOMAIN} > /etc/mailname \
 && newaliases

exec /usr/sbin/postfix start-fg
