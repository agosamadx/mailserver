#!/bin/sh

for i in ${USERS}; do
  USER=$(echo $i | cut -d':' -f 1)
  useradd -m -d /home/$USER $USER
  echo $i | chpasswd
done

if [ -f /etc/postfix/main.cf ]; then
  sed -i -e "s/MAIL_DOMAIN/${MAIL_DOMAIN}/g" /etc/postfix/main.cf
  sed -i -e "s/MX_DOMAIN/${MX_DOMAIN}/g" /etc/postfix/main.cf
  sed -i -e "s/ADDITIONAL_SMTP_DESTINATIONS/${ADDITIONAL_SMTP_DESTINATIONS}/g" /etc/postfix/main.cf
fi
if [ -f /etc/dovecot/conf.d/10-ssl.conf ]; then
  sed -i -e "s/MX_DOMAIN/${MX_DOMAIN}/g" /etc/dovecot/conf.d/10-ssl.conf
fi

while [ ! -f /etc/letsencrypt/live/${MX_DOMAIN}/fullchain.pem ]; do
  sleep 1
done
while [ ! -f /etc/letsencrypt/live/${MX_DOMAIN}/privkey.pem ]; do
  sleep 1
done

echo ${MAIL_DOMAIN} > /etc/mailname
newaliases
