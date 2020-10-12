# Use Debian Buster as our base.
FROM debian:buster-slim

# Update package list.
RUN apt-get update

# Install some common prerequisites.
RUN apt-get install -y -q apt-utils apt-transport-https lsb-release ca-certificates curl wget

# Install unzip as it is recommended by Composer to extract packages.
RUN apt-get install -y -q unzip

# Install git.
RUN apt-get install -y -q git

# Install Python.
RUN apt-get install -y -q python3

# Install tools for deployment.
RUN apt-get install -y -q openssh-client rsync sshpass

# Install PHP packages from deb.sury.org.
RUN wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg
RUN sh -c 'echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list'
RUN apt-get update
RUN apt-get install -y -q php7.3-cli php7.3-bz2 php7.3-curl php7.3-gd php7.3-imap php7.3-intl php7.3-json php7.3-ldap php7.3-mbstring php7.3-mysql php7.3-opcache php7.3-sqlite3 php7.3-xml php7.3-xsl php7.3-zip php-mongodb php-redis php-solr php-xdebug php-imagick

# Install Node.js.
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
RUN apt-get install -y -q nodejs

# Install Composer.
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php composer-setup.php --no-ansi --install-dir=/usr/bin --filename=composer
RUN php -r "unlink('composer-setup.php');"

# Install Composer package for faster installs.
RUN composer global require hirak/prestissimo

# Run Composer.
CMD ["composer"]
