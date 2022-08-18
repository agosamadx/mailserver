#!/bin/sh

echo ${MAIL_DOMAIN} > /etc/mailname

if [ -f /etc/postfix/main.cf ]; then
  sed -i -e "s/__MAIL_DOMAIN__/${MAIL_DOMAIN}/g" /etc/postfix/main.cf
  sed -i -e "s/__MX_DOMAIN__/${MX_DOMAIN}/g" /etc/postfix/main.cf
  sed -i -e "s/__ADDITIONAL_MAIL_DOMAINS__/${ADDITIONAL_MAIL_DOMAINS}/g" /etc/postfix/main.cf
fi
if [ -f /etc/dovecot/conf.d/10-ssl.conf ]; then
  sed -i -e "s/__MX_DOMAIN__/${MX_DOMAIN}/g" /etc/dovecot/conf.d/10-ssl.conf
fi

while [ ! -f /etc/letsencrypt/live/${MX_DOMAIN}/fullchain.pem ]; do
  sleep 1
done
while [ ! -f /etc/letsencrypt/live/${MX_DOMAIN}/privkey.pem ]; do
  sleep 1
done

if [ ! -d /home/virtual ]; then
  mkdir /home/virtual
  chown vmail:vmail /home/virtual
fi
for i in ${USERS}; do
  ADDR=$(echo $i | cut -d':' -f 1)
  USER=$(echo $ADDR | cut -d'@' -f 1)
  DOMAIN=$(echo $ADDR | cut -d'@' -f 2)
  PASS=$(echo $i | cut -d':' -f 2)
  echo "${USER}@${DOMAIN} ${DOMAIN}/${USER}/Maildir/" >> /etc/postfix/vmailbox
  echo "${USER}@${DOMAIN}:$(/usr/bin/doveadm pw -s cram-md5 -p ${PASS})" >> /etc/dovecot/users
  echo "${USER}@${DOMAIN} ${USER}@${DOMAIN}" >> /etc/postfix/vuseraliases
done
if [ -f /etc/postfix/vmailbox ]; then
  /usr/sbin/postmap /etc/postfix/vmailbox
fi
if [ -f /etc/postfix/vuseraliases ]; then
  /usr/sbin/postmap /etc/postfix/vuseraliases
else
  touch /etc/postfix/vuseraliases
fi
if [ -f /etc/postfix/valiases ]; then
  /usr/sbin/postmap /etc/postfix/valiases
fi
if [ -f /var/lib/dovecot/sieve/default.sieve ]; then
  sievec /var/lib/dovecot/sieve/default.sieve
fi
