#!/bin/sh -xe

# Install dependences
sudo apt-get install gcc-4.8
sudo apt-get install g++-4.8
sudo apt-get install git -y

# Install C client
wget https://download.opensuse.org/repositories/home:/knonomura/xUbuntu_18.04/amd64/griddb-c-client_4.5.0_amd64.deb
sudo dpkg -i griddb-c-client_4.5.0_amd64.deb

# Install SWIG
#wget https://prdownloads.sourceforge.net/swig/swig-4.0.0.tar.gz
#tar xvfz swig-4.0.0.tar.gz
#cd swig-4.0.0
git clone https://github.com/swig/swig.git
cd swig
./autogen.sh
./configure
make
sudo make install
cd ..

# Install PHP
sudo apt-get update
sudo apt -y install software-properties-common
sudo apt-add-repository ppa:ondrej/php
sudo apt-get update
sudo apt -y install php7.4
#sudo ln -sf /usr/bin/php7.4 /usr/bin/php
php --version

# Install PHP composer
curl -sS https://getcomposer.org/installer | sudo php
sudo mv composer.phar /usr/local/bin/composer
sudo chmod +x /usr/local/bin/composer

# Install Zend Framework
composer require zendframework/zendframework
#sudo mv /usr/include/php/20190902/* /usr/include/php/
sudo mv /usr/include/php/20200930/* /usr/include/php/
phpunit --version

