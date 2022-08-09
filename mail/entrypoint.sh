#!/bin/sh

./preprocess.sh

exec /usr/bin/supervisord
