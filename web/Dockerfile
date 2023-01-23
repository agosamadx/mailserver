FROM debian:bookworm
MAINTAINER ago

ENV DEBIAN_FRONTEND noninteractive
ENV TZ Asia/Tokyo

RUN apt-get update \
 && apt-get install -y apache2 libapache2-mod-php php-intl php-mbstring php-xml php-gd php-zip php-sqlite3 git sudo sqlite3 curl unzip \
 && apt-get clean

RUN curl -sL https://deb.nodesource.com/setup_lts.x | bash - \
 && apt-get update \
 && apt-get install -y nodejs \
 && apt-get clean \
 && npm install -g less less-plugin-clean-css

RUN cd /usr/local/bin \
 && php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
 && php composer-setup.php \
 && php -r "unlink('composer-setup.php');"

RUN rm -r /var/www/html \
 && chown www-data:www-data /var/www \
 && cd /var/www \
 && sudo -u www-data git clone --depth 1 -b 1.6.0 https://github.com/roundcube/roundcubemail.git html \
 && cd html \
 && sudo -u www-data mv composer.json-dist composer.json \
 && sudo -u www-data composer.phar install --no-dev \
 && sudo -u www-data mkdir /var/www/database \
 && bin/install-jsdeps.sh \
 && rm -r installer \
 && cd skins/elastic \
 && lessc --clean-css="--s1 --advanced" styles/styles.less > styles/styles.min.css \
 && lessc --clean-css="--s1 --advanced" styles/print.less > styles/print.min.css \
 && lessc --clean-css="--s1 --advanced" styles/embed.less > styles/embed.min.css

COPY ./etc /etc
COPY ./var /var
COPY ./preprocess.sh /
COPY ./entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
