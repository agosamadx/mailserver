#!/bin/sh

if [ -f /var/www/html/config/config.inc.php ]; then
  sed -i -e "s/MAIL_DOMAIN/${MAIL_DOMAIN}/g" /var/www/html/config/config.inc.php
fi
if [ -f /etc/apache2/sites-available/default-ssl.conf ]; then
  sed -i -e "s/MAIL_SERVER_DOMAIN/${MAIL_SERVER_DOMAIN}/g" /etc/apache2/sites-available/default-ssl.conf
fi

while [ ! -f /etc/letsencrypt/live/${MAIL_SERVER_DOMAIN}/cert.pem ]; do
  sleep 1
done
while [ ! -f /etc/letsencrypt/live/${MAIL_SERVER_DOMAIN}/privkey.pem ]; do
  sleep 1
done
while [ ! -f /etc/letsencrypt/live/${MAIL_SERVER_DOMAIN}/chain.pem ]; do
  sleep 1
done
