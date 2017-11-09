#sudo apt-get install chromium-browser 

wget http://repo.zabbix.com/zabbix/3.2/ubuntu/pool/main/z/zabbix-release/zabbix-release_3.2-1+xenial_all.deb
sudo dpkg -i zabbix-release_3.2-1+xenial_all.deb && sudo apt-get update
sudo apt install zabbix-server-mysql zabbix-frontend-php -y
sudo apt install php-mbstring php-bcmath php-xmlwriter -y
sudo apt install zabbix-agent -y
sudo mysql -uroot -e "CREATE DATABASE zabbix CHARACTER SET utf8 COLLATE utf8_bin";
sudo mysql -uroot -e "CREATE USER 'zabbix'@'localhost'";
sudo mysql -uroot -e "GRANT ALL ON zabbix.* TO 'zabbix'@'localhost'";

sudo mysql -uroot -e "SHOW DATABASES";
sudo mysql -uroot -e "SELECT host, user FROM mysql.user";
sudo mysql -uroot -e "SHOW GRANTS FOR 'zabbix'@'localhost'";
zcat /usr/share/doc/zabbix-server-mysql/create.sql.gz | mysql -uroot zabbix
sudo sed -i 's/# php_value date.timezone Europe\/Riga/php_value date.timezone Europe\/Minsk/g' /etc/apache2/conf-enabled/zabbix.conf

sudo apt-get install php-bcmath -y
sudo apt-get install php-mbstring -y
sudo apt-get install php-xmlwriter -y
sudo apt-get install php-xmlreader -y

sudo service zabbix-server start
sudo service zabbix-agent start

sudo service apache2 restart
