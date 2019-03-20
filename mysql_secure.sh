# Make sure that NOBODY can access the server without a password
sudo -E mysql -e "UPDATE mysql.user SET Password = PASSWORD('vagrant') WHERE User = 'root'"

# Kill the anonymous users
sudo -E mysql -e "DROP USER ''@'localhost'"

# Because our hostname varies we'll use some Bash magic here.
sudo -E mysql -e "DROP USER ''@'$(hostname)'"

# Kill off the demo database
sudo -E mysql -e "DROP DATABASE test"

# Make our changes take effect
sudo -E mysql -e "FLUSH PRIVILEGES"
