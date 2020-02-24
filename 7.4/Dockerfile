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
RUN apt-get install -y -q php7.4-cli php7.4-bz2 php7.4-curl php7.4-gd php7.4-imap php7.4-intl php7.4-json php7.4-ldap php7.4-mbstring php7.4-mysql php7.4-opcache php7.4-sqlite3 php7.4-xml php7.4-xsl php7.4-zip php-mongodb php-redis php-solr php-xdebug

# Install Node.js.
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
RUN apt-get install -y -q nodejs

# Install Composer.
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php -r "if (hash_file('sha384', 'composer-setup.php') === 'e0012edf3e80b6978849f5eff0d4b4e4c79ff1609dd1e613307e16318854d24ae64f26d17af3ef0bf7cfb710ca74755a') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
RUN php composer-setup.php --no-ansi --install-dir=/usr/bin --filename=composer
RUN php -r "unlink('composer-setup.php');"

# Install git.
RUN apt-get install -y -q git

# Install tools for deployment.
RUN apt-get install -y -q openssh-client rsync

# Run Composer.
CMD ["composer"]
