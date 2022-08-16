FROM debian:stable
MAINTAINER ago

ENV DEBIAN_FRONTEND noninteractive
ENV TZ Asia/Tokyo

RUN apt-get update \
 && apt-get install -y postfix dovecot-imapd dovecot-sieve dovecot-managesieved supervisor busybox-static \
 && apt-get clean

RUN groupadd -g 10000 vmail \
 && useradd -u 10000 -g vmail vmail

COPY ./etc /etc
COPY ./var /var
COPY ./preprocess.sh /
COPY ./entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
