#!/bin/sh

./preprocess.sh

if [ ! -f /var/www/database/sqlite.db ]; then
  sudo -u www-data sqlite3 -init /var/www/html/SQL/sqlite.initial.sql /var/www/database/sqlite.db
fi

apachectl -DFOREGROUND
