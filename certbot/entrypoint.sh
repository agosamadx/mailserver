#!/bin/sh

if [ ! -f /etc/letsencrypt/renewal/${MX_DOMAIN}.conf ]; then
  certbot certonly --webroot -w /var/www/html -d ${MX_DOMAIN} -d ${SMTP_DOMAIN} -d ${IMAP_DOMAIN} -m postmaster@${MAIL_DOMAIN} --non-interactive --agree-tos
fi

busybox crond -l 8 -L /dev/stderr -f
