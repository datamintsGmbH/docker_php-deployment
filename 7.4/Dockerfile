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
RUN apt-get install -y -q php7.4-cli php7.4-bz2 php7.4-curl php7.4-gd php7.4-imap php7.4-intl php7.4-json php7.4-ldap php7.4-mbstring php7.4-mysql php7.4-opcache php7.4-sqlite3 php7.4-xml php7.4-xsl php7.4-zip php7.4-mongodb php7.4-redis php7.4-solr php7.4-imagick

# Install Node.js.
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
RUN apt-get install -y -q nodejs

# Install Composer.
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php composer-setup.php --no-ansi --install-dir=/usr/bin --filename=composer
RUN php -r "unlink('composer-setup.php');"

# Run Composer.
CMD ["composer"]
