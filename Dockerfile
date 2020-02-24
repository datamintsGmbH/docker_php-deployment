# Use Debian Buster as our base.
FROM debian:buster-slim

# Update package list.
RUN apt-get update

# Install some common prerequisites.
RUN apt-get install -y -q apt-utils apt-transport-https lsb-release ca-certificates curl wget

# Install PHP packages from deb.sury.org.
RUN wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg
RUN sh -c 'echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list'
RUN apt-get update
RUN apt-get install -y -q php7.2-cli php7.2-bz2 php7.2-curl php7.2-gd php7.2-imap php7.2-intl php7.2-json php7.2-ldap php7.2-mbstring php7.2-mysql php7.2-opcache php7.2-sqlite3 php7.2-xml php7.2-xsl php7.2-zip php-mongodb php-redis php-solr php-xdebug

# Install Node.js.
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
RUN apt-get install -y -q nodejs

# Install Composer.
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php -r "if (hash_file('sha384', 'composer-setup.php') === 'e0012edf3e80b6978849f5eff0d4b4e4c79ff1609dd1e613307e16318854d24ae64f26d17af3ef0bf7cfb710ca74755a') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
RUN php composer-setup.php --no-ansi --install-dir=/usr/bin --filename=composer
RUN php -r "unlink('composer-setup.php');"

# Install tools for deployment.
RUN apt-get install -y -q openssh-client rsync

# Use Composer as the entrypoint.
ENTRYPOINT ["composer"]

# Run Composer.
CMD ["composer"]