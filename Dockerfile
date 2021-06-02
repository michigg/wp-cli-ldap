FROM wordpress:5.7.2-php7.4-apache

RUN set -x \
    && apt-get update \
    && apt-get install -y libldap2-dev less \
    && rm -rf /var/lib/apt/lists/* \
    && docker-php-ext-configure ldap --with-libdir=lib/x86_64-linux-gnu/ \
    && docker-php-ext-install ldap \
    && apt-get purge -y --auto-remove libldap2-dev

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x  wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp
