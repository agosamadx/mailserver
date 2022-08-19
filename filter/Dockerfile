FROM debian:bookworm
MAINTAINER ago

ENV DEBIAN_FRONTEND noninteractive
ENV TZ Asia/Tokyo

RUN apt-get update \
 && apt-get install -y amavisd-new clamav-daemon spamassassin supervisor busybox-static \
 && apt-get clean

RUN gpasswd -a clamav amavis \
 && mkdir /var/run/clamav \
 && chown clamav /var/run/clamav

COPY ./etc /etc
COPY ./var /var
COPY ./preprocess.sh /
COPY ./entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
