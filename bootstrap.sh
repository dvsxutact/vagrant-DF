# Bootstrap file.

# Always a good idea to apt update after starting a box.
sudo -E apt update

# Install prerequisites for installing dreamfactory.
sudo -E apt-get -y -q install git curl zip unzip

# Now we need to install PHP 7.1, this requires a special library.
sudo -E add-apt-repository ppa:ondrej/php

# Update apt... again
sudo -E apt-get -y -q update

# We are going to use nginx for this build. so install the depends.
sudo -E apt-get -y -q install php7.1-fpm php7.1-common php7.1-xml php7.1-cli php7.1-curl php7.1-json php7.1-mcrypt php7.1-mysqlnd php7.1-sqlite php7.1-soap php7.1-mbstring php7.1-zip php7.1-bcmath

# gonna try this, but i doubt it will work.
echo "cgi.fix_pathinfo=0" >> /etc/php/7.1/fpm/php.ini

# now prep for php mongodb extension
sudo -E apt-get -y -q install php7.1-dev php-pear build-essential libsslcommon2-dev libssl-dev libcurl4-openssl-dev pkg-config

# Now install the extension using pecl
sudo -E pecl install mongodb

# Create an ini file for mongo.
sudo -E sh -c 'echo "extension=mongodb.so" > /etc/php/7.1/mods-available/mongodb.ini'

# Now enable the extension
sudo -E phpenmod mongodb

# Make a directory for composer setup.
mkdir -p ~/bin

# download the installer
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"

# now install composer.
php composer-setup.php --install-dir=/home/vagrant/bin --filename=composer
