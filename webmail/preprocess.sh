#!/bin/sh

if [ -f /var/www/html/config/config.inc.php ]; then
  sed -i -e "s/__MAIL_DOMAIN__/${MAIL_DOMAIN}/g" /var/www/html/config/config.inc.php
  sed -i -e "s/rcmail-\!24ByteDESkey\*Str/$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 24 | head -n 1)/" /var/www/html/config/config.inc.php
fi
if [ -f /etc/apache2/sites-available/default-ssl.conf ]; then
  sed -i -e "s/__MX_DOMAIN__/${MX_DOMAIN}/g" /etc/apache2/sites-available/default-ssl.conf
fi

while [ ! -f /etc/letsencrypt/live/${MX_DOMAIN}/cert.pem ]; do
  sleep 1
done
while [ ! -f /etc/letsencrypt/live/${MX_DOMAIN}/privkey.pem ]; do
  sleep 1
done
while [ ! -f /etc/letsencrypt/live/${MX_DOMAIN}/chain.pem ]; do
  sleep 1
done
