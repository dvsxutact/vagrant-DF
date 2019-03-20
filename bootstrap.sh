# Bootstrap file.

# Always a good idea to apt update after starting a box.
sudo -E apt update

# now we gotta figure out how to install dreamfactory. lets start by covering depends.
sudo -E apt-get -q -y install curl apache2 php5 php5-common php5-cli php5-curl php5-mcrypt php5-gd php5-mysql mysql-server mysql-client git
