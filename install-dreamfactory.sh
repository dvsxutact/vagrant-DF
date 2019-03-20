 sudo mkdir /opt/dreamfactory
 
 sudo chown -R vagrant /opt/dreamfactory
 
 cd /opt/dreamfactory
 
 git clone https://github.com/dreamfactorysoftware/dreamfactory.git ./
 
 composer install --no-dev
 
 php artisan df:env --db_connection=mysql --db_host=localhost --db_port=3306 --db_database=dreamfactory --db_username=dfadmin --db_password=dr3amFact0ry!
 
 echo "DB_CHARSET=utf8" >> /opt/dreamfactory/.env
 echo "DB_COLLATION=utf8_unicode_ci" >> /opt/dreamfactory/.env
 
 php artisan df:setup --admin_first_name=vagrant --admin_last_name=vagrant --admin_email=noemail@noeamil.com --admin_password=vagrant
 
 sudo -E sudo chown -R www-data:vagrant storage/ bootstrap/cache/
 
 sudo -E sudo chmod -R 2775 storage/ bootstrap/cache/
 
 php artisan cache:clear
