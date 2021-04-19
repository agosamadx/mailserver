#!/bin/sh

if [ ! -f /etc/letsencrypt/renewal/${MAIL_SERVER_DOMAIN}.conf ]; then
  certbot --standalone --non-interactive -d ${MAIL_SERVER_DOMAIN} -d ${SMTP_DOMAIN} -d ${IMAP_DOMAIN} -m postmaster@${MAIL_DOMAIN} --agree-tos certonly
fi

busybox crond -l 8 -L /dev/stderr -f
