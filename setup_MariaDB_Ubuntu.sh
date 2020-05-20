# https://www.digitalocean.com/community/tutorials/how-to-install-mariadb-on-ubuntu-18-04
# https://www.a2hosting.com/kb/developer-corner/mysql/managing-mysql-databases-and-users-from-the-command-line
# https://mariadb.com/kb/en/set-password/

# update Ubuntu packages
sudo apt update
# Install MariaDB
sudo apt install mariadb-server
# install unix_socket
mysql -u root -e "INSTALL PLUGIN unix_socket SONAME 'auth_socket';"
# Set privileges. This allows to execution of queries from the command line without entering password.  
mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO 'roy'@'localhost' IDENTIFIED VIA unix_socket;"
# Create database 'project'
mysql -u roy -e "CREATE DATABASE project"

