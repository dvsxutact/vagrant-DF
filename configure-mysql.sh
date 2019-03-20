# Create a database for dreamfactory.
sudo -E mysql --user="root" --execute="CREATE DATABASE dreamfactory;"

# Create the dream factory user and assign permissions
sudo -E mysql --user="root" --execute="GRANT ALL PRIVILEGES ON dreamfactory.* to 'dfadmin'@'localhost' IDENTIFIED BY 'dr3amFact0ry!';"

# flush privileges table.
sudo -E mysql --user="root" --execute="FLUSH PRIVILEGES;"
