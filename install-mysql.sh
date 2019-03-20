# Lets Install MariaDB

# First Add the MariaDB Repos
sudo -E apt-get -y -q install software-properties-common
sudo -E apt-key -y -q adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xF1656F24C74CD1D8
sudo -E add-apt-repository 'deb [arch=amd64,arm64,i386,ppc64el] http://ftp.utexas.edu/mariadb/repo/10.3/ubuntu xenial main'

# ugh, update apt again!
sudo -E apt update

# FINALLY. install MariaDB!
sudo -E apt -y -q install mariadb-server

# Now Start MariaDB
sudo -E systemctl start mysql

# Set MariaDB to start with the system
sudo -E systemctl enable mysql
