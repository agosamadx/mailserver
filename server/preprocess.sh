#!/bin/sh

for i in ${USERS}; do
  USER=$(echo $i | cut -d':' -f 1)
  useradd -m -d /home/$USER $USER
  echo $i | chpasswd
done

if [ -f /etc/postfix/main.cf ]; then
  sed -i -e "s/MAIL_DOMAIN/${MAIL_DOMAIN}/g" /etc/postfix/main.cf
fi
if [ -f /etc/postfix/main.cf ]; then
  sed -i -e "s/MAIL_SERVER_DOMAIN/${MAIL_SERVER_DOMAIN}/g" /etc/postfix/main.cf
fi
if [ -f /etc/dovecot/conf.d/10-ssl.conf ]; then
  sed -i -e "s/MAIL_SERVER_DOMAIN/${MAIL_SERVER_DOMAIN}/g" /etc/dovecot/conf.d/10-ssl.conf
fi

while [ ! -f /etc/letsencrypt/live/${MAIL_SERVER_DOMAIN}/fullchain.pem ]; do
  sleep 1
done
while [ ! -f /etc/letsencrypt/live/${MAIL_SERVER_DOMAIN}/privkey.pem ]; do
  sleep 1
done
