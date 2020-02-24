# datamints/php-deployment

Docker image for deployment of PHP applications, intended for use within GitLab CI.

The image comes with tags `7.2`, `7.3`, and `7.4` where the tags represent the PHP version inside the image.


## PHP

The package uses PHP from deb.sury.org with the following extensions:

- bz2
- curl
- gd
- imap
- intl
- json
- ldap
- mbstring
- mongodb
- mysql
- opcache
- redis
- solr
- sqlite3
- xdebug
- xml
- xsl
- zip


## Composer

Composer is installed in version 1.9.3; if you want the latest one, add the following line to your `.gitlab.yml` file:

> composer selfupdate


## Node.js

Node.js is installed in version 12.


# Other things.

For deployment, the following packages are installed:

- git
- openssh-client
- rsync


## Build/update

You can use the i
