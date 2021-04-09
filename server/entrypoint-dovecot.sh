#!/bin/sh

./preprocess.sh

exec /usr/sbin/dovecot -F
