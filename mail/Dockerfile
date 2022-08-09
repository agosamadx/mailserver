FROM debian:stable
MAINTAINER ago

ENV DEBIAN_FRONTEND noninteractive
ENV TZ Asia/Tokyo

RUN apt-get update \
 && apt-get install -y postfix dovecot-imapd dovecot-sieve dovecot-managesieved supervisor \
 && apt-get clean

COPY ./etc /etc
COPY ./preprocess.sh /
COPY ./entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
