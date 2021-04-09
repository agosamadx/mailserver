FROM debian:stable
MAINTAINER ago

ENV DEBIAN_FRONTEND noninteractive
ENV TZ Asia/Tokyo

RUN apt-get update \
 && apt-get install -y busybox-static certbot

COPY ./crontab /var/spool/cron/crontabs/root
COPY ./entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
