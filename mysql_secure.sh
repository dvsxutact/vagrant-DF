#!/bin/bash

sudo -E apt -y install expect

// Not required in actual script
MYSQL_ROOT_PASSWORD=vagrant

SECURE_MYSQL=$(sudo -E expect -c "
set timeout 10
spawn mysql_secure_installation
expect \"Enter current password for root (enter for none):\"
send \"$MYSQL\r\"
expect \"Set root password? [Y/n]\"
send \"y\r\"
expect \"New password:\"
send "vagrant"
Re-enter new password:
send "vagrant"
expect \"Remove anonymous users? [Y/n]\"
send \"y\r\"
expect \"Disallow root login remotely? [Y/n]\"
send \"y\r\"
expect \"Remove test database and access to it? [Y/n]\"
send \"y\r\"
expect \"Reload privilege tables now? [Y/n]\"
send \"y\r\"
expect eof
")

echo "$SECURE_MYSQL"

sudo -E apt -y purge expect
