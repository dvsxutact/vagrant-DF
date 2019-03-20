 sudo mkdir /opt/dreamfactory
 
 sudo chown -R dfuser /opt/dreamfactory
 
 cd /opt/dreamfactory
 
 git clone https://github.com/dreamfactorysoftware/dreamfactory.git ./
 
 composer install --no-dev
 
 php artisan df:env
 
 
 
