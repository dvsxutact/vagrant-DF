# Install nginx
sudo -E apt install -y -q nginx

## move the default config file to a backup.
sudo -E mv /etc/nginx/sites-available/default /etc/nginx/sites-available/default.bak

## Copy the config file into place
sudo -E cp /vagrant/nginx.conf /etc/nginx/sites-available/default

# Allow Nginx Http through the firewall
sudo -E /usr/sbin/ufw allow 'Nginx HTTP'

# Allow Nginx Https through the firewall
sudo -E /usr/sbin/ufw allow 'Nginx HTTPS'

# Restart nginx
sudo -E service php7.1-fpm restart
sudo -E service nginx restart
