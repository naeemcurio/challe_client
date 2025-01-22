ls
cd /var/www
ls
git clone https://github.com/Cyber-Advance-Soliution/challe.git html
ls
mv /var/www/phpmyadmin /var/www/html/public
ls
cd /etc/apache2
ls
nano apache2.conf
cd sites-available
ls
nano 000-default.conf
sudo a2enmod rewrite
systemctl restart apache2
nano 000-default.conf
systemctl restart apache2
cd /var/www
ls
cd html
ls
composer -v
cd ~
curl -sS https://getcomposer.org/installer -o /tmp/composer-setup.php
HASH=`curl -sS https://composer.github.io/installer.sig`
echo $HASH
php -r "if (hash_file('SHA384', '/tmp/composer-setup.php') === '$HASH') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
composer
sudo php /tmp/composer-setup.php --install-dir=/usr/local/bin --filename=composer
composer
cd /var/www/html
composer install
nano .env
chmod 7777 storage
chmod -R 777 storage
php artisan migrate --sed
php artisan migrate --seed
php artisan migrate:fresh
php artisan seed --class=RoleTableSeeder
php artisan db:seed --class=RoleTableSeeder
php artisan db:seed --class=UserTableSeeder
ls
cd /var/www
ls
cd html
ls
chmod 7777 public
chmod -R 777 public
cd /etc/php/
ls
cd 8.3
ls
cd apache2
ls
nano php.ini
systemctl restart apache2
nano php.ini
systemctl restart apache2
php info((
php info()
cd /etc/apache2/sites-available
ls
nano 000-default.conf
systemctl restart apache2
tail -f /var/log/apache2/error.log
tail -f /var/log/php8.3-fpm.log
cd /var/www/html
ls
cd storage
ls
cd logs
ls
nano laravel.log
cd ..
ls
sudo systemctl restart php8.3-fpm
php -v
cd /var/www/html
ls
cd public
ls
nano index.php
nano p
nano index.php
ls
cd ..
ls
cd routes
ls
cd ..
git pull origin master
cd /var/
ls
cd logs
cd log
ls
cd apache2
ls
nano error.log
tail -f error.log 
which php
php =v
php -v
cd /etc/php
ls
cd 8.3
ls
cd apache2
ls
nano php.ini
systemctl restart apache2
cd /ect/apache2
cd /etc/apache2
ls
cd sites-available
ls
nano 000-default.conf
systemctl restart apache2
nano 000-default.conf
service apache2 status
service nginx status
nano /etc/apache2/sites-available/000-default.conf
service apache2 restart
nano /etc/apache2/sites-available/000-default.conf
service apache2 restart
certbot -d challe.pro
sudo apt update
sudo apt install certbot python3-certbot-apache
certbot -d challe.pro
systemctl restart apache2
systemctl status apache2
sudo su
ls
cd /var/www
ls
cd html
ls
git pull origin master
cd public
ls
nano .htaccess
cd ..
git add .
git commit -m "change in htaccess"
git pull origin master
git stash
git pull origin master
ls
cd public
ls
ls -a
nano .htaccess
cd ..
cd /etc/apache2
ls
cd  sites-available
ls
nano 000-default.conf
cd /var/www
ls
cd html
ls
ls -a
cd public
ls
ls -a
nano .htaccess
cd phpmyadmin
mkdir phpmyadmin
nano index.php
cd phpmyadmin
ls
nano index.php
cd ..
ls
cd  public
;ls
ls
cd ..
cd /etc/apache2
ls
cd sites-available
ls
nano 000-default.conf
systemcl restart apache2
systemctl restart apache2
cd /var/www
ls
cd htnml
cd html
ls
cd  /var/wwww
cd  /var/www
ls
cd html
ls
cd public
cd ..
php artisan server
php artisan serve
cd public
ls
ls -a
cd phpmyadmin
ls
cd ..
rm -rf phpmyadmin
cd ..
sudo ln -s /etc/phpmyadmin/apache.conf /etc/apache2/conf-available/phpmyadmin.conf
sudo ln -s /usr/share/phpmyadmin /var/www/html/public/phpmyadmin
sudo service apache2 restart
cd public
ls
cd phpmyadmin
ls
cd ..
ls
cd /etc/nginx
ls
cd /etc/apache2
ls
cd sites-available
ls
nano 000-default.conf
systemctl restart apache2
nano  /var/log/apache2/error.log
systemctl apache2 status
systemctl apache2
service apache2 status
nano /etc/apache2/apache2.conf
sudo systemctl reload apache2
ls
nano 000-default.conf
sudo systemctl reload apache2
nano 000-default.conf

nano /etc/apache2/httpd.conf

nano 000-default.conf
sudo systemctl reload apache2
cd ..
ls
cd sites-available
ls
cd .
cd ..
ls
nano apache2.conf
sudo systemctl reload apache2

nano  /var/log/apache2/error.log
ls
cd sites-available
ls
nano  000-default.conf
systemctl restart apache2
ls
nano default-ssl.conf
nano 000-default-le-ssl.conf
systemctl restart apache2
nano 000-default-le-ssl.conf
nano 000-default.conf
systemctl restart apache2
cd /var/www
l
cd html
ls
cd public
ls
cd .htaccess
nano .htaccess
cd ..
git pull origin master
git stash
git pull origin master
cd /var/wwww
ls
cd /var/www
ls
cd  html
git pull origin master
top
sudo apt update 
sudo apt upgrade -y
sudo apt install apache2 mysql-server php libapache2-mod-php php-mysql php-cli php-zip php-curl php-xml php-mbstring unzip curl -y
curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer
cd /var/www/html
sudo composer create-project --prefer-dist laravel/laravel challe_app
sudo chown -R www-data:www-data challe_app 
sudo chmod -R 775 challe_app
dpkg -l | grep phpmyadmin
sudo nano /etc/apache2/sites-available/challe.us.conf
sudo systemctl restart apache2
cd /var/www
ls
cd /var/www/html
ls
cd challe_app
ls
sudo a2ensite challe.us.conf
sudo systemctl restart apache2
sudo certbot renew --dry-run
sudo certbot --apache -d challe.us -d www.challe.us
sudo certbot --apache -d challe.us
mkdir admin
mv /* /admin
cd admin 
cd ..
mv /* admin
mv /var/www/html/challe_app admin
mv /var/www/html/challe_ap/*p admin
mv /var/www/html/challe_app/* admin
mv ~/challe_app/* admin
cd admin
ls
mv sfsdf
cd ..
mv /var/www/html/challe_app/* admin
cd /var/www
;s
ls
cd html
git pull origin master
php artisan migrate
ls
cd /var/www/
ls
cd html
nano .env
php artisan config:cache
nano .env
php artisan config:cache
ls
cd app
ls
cd ..
php artisan clear:cache
php artisan cache:clear
php artisan optimize:clear
ls
chmod 777 bootstrap
chmod -R 777 bootstrap
nano .env
php artisan config:cache
php artisan optimize:clear
nano .env
php artisan optimize:clear
sudo apt install php-intl
sudo systemctl restart apache2
cd /var/www/html
git pull origin master
cd /var/www/html
git pull origin master
ls
cd /var/www
ls
cd  html
cd /etc/apache2
ls
cd sites-available
ls
nano challe.us.conf
cd /etc/apache2
ls
cd sites-available
l
sls
ls
nano 000-default.conf
cd ..
cd /var/www
ls
cd htm
ls
cd html
ls
ls -a
cd public
ls
nano .htaccess
cd /var/www
cd /etc/apache2
ls
cd conf-available
ls
cd ..
ls
nano apache2.conf
cd ..
ls
cd phpp
cd php
'ls
ls
ls
cd 8.3
ls
cd apache2
ls
nano php.ini
cd /etc/
ls
cd apache2
ls
nano apache2.conf
ls
cd sites-available
ls
nano 000-default.conf
ls
nano challe.us.conf
cd ..
ls
nano envvars
cd /var/www/html
ls -a
cd /var/www/htmnl
cd /var/www/html
ls
nano .env
cd /var/www
;s
l
ls
cd html
git pull origin master
ls
cd /var/www
ls
cd html;
git pull origin master
cd /var/www
ls
cd html
git pull origin master
cd /var/www/htm
cd /var/www/html
git pull origin master
sudo su
cd /var/www
cd html
sudo apt update
sudo apt install supervisor
sudo systemctl status supervisor
cd /var/www
ls
cd html
ls
git branch
git checkout workerman
git fetch --all
git checkout workerman
composer install
cd /etc/supervisor/conf.d
ls
nano challe_worker.conf
supervisorctl reread
supervisorctl status
cd /var/www/html
ls
php artisan migrate
ufw list
php artisan start
ufw
ufw list
ufw allow 8081/tcp
ufw allow 8081/udp
ufw
supervisorctl stop
supervisorctl stop all
php artisan start
supervisorctl start all
nano .env
php artisan optimize:cealr
php artisan optimize:clear
git pull origin workerman
supervisorctl restart all
cd /var/www/html
git pull origin workerman
supervisorctl restart all
php artisan optimize:clear
git pull origin workerman
php artisan optimize:clear
git pull origin workerman
cd /var/www/html
ls
nano .env
php artisan optimize:clear
php artisan cache:clear
php artisan config:cache
php artisan optimize:clearcd /var/www
ls
cd html
ls
git pull origin workerman
git add .
git commit -m "Done"
git config --global user.email "mkhurramilyas@gmail.com"
git pull origin workerman
nano .env
ls
cd /var/www/html
ls
nano .env
php artisan optimize:clear
cd /var/www/html
nano .env
cd /var/www
ls
cd html
git pull origin workerman
php artisan migrate
sudo su
cd /var/www/html
git pull origin workerman
php artisan migrate
composer instal
apt update
apt install vsftpd
service vsftpd status
nano /etc/vsftpd.conf
service vsftpd restart
adduser cas
cd /var/www/html
sudo usermod -d /var/www/html -m cas
chmod -R 777 /var/www/html
ls -al
chown -R cas:www-data /var/www/html
ls -al
service apache2 restart
cd /var/www/html
git pull origin workerman
git branch
git add .
git commit -m "done"
git pull origin workerman
git config pull.rebase false 
git pull origin workerman
nano app/Http/Controllers/Admin/LeaderBoardController.php 
supervisorctl restart all
cd /var/www/html
git pull origin workerman
composer install
cd /var/www/html
git branch
git pull origin workerman
php artisan migrate
nano .env
php artisan optimize:clear
nano .env
cd /var/www/html
git pull origin workerman
cd /var/www/html
git pull origin workerman
cd /var/www
cd html
git pull origin workerman
sudo su
ls
cd /var/www/html
git pull origin workerman
cd /var/www
ls
cd html
sudo apt install supervisor
sudo systemctl status supervisor
cd /etc/supervisor/conf.d
ls
cd ..
cd .
supervisorctl status
cd ..
cd /var/www/html
git fetch --all
git checkout challe_v2.0_without_lps
supervisorctl restart all
cd /etc/supervisorctl
cd /etc/supervisor
ls
cd conf.d
ls
nano challe_worker.conf
cd ..
cd /var/www
ls
cd thml
cd html
ls
cd app
cd console
cd Console
ls
cd Commands
ls
cd SocketConfiguration
nao SocketConfiguration
nano SocketConfiguration
nano SocketConfiguration.php
cd ..
cd html
ls
nano .env
php artisan config:clear
php artisna migrate
php artisan migrate
nano .env
php artisan config:clear
ufw status
git checkout challe_v2.0_without_lps
git pull origin challe_v2.0_without_lps
cd /etc/letsencrypt/live
ls
nano challe.pro
cd challe.pro
ls
git pull origin challe_v2.0_without_lps
cd /var/www/html
git pull origin challe_v2.0_without_lps
nano .env
supervisorctl restart all
nano .env
git pull origin challe_v2.0_without_lps
nano .env
php artisan config:clear
git checkout challe_v2.0
git pull origin challe_v2.0
php artisan migrate
supervisorctl restart all
nano .env
php artisan config:clear
git pull origin challe_v2.0
nano .env
php artisan config:clear
ls
cd ..
ls
cd html
ls
cd public
ls
sudo ln -s /etc/phpmyadmin/apache.conf /etc/apache2/conf-available/phpmyadmin.conf
sudo ln -s /usr/share/phpmyadmin /var/www/html/public/phpmyadmin
sudo service apache2 restart
cd ..
git pull origin challe_v2.0
supervisorctl restart all
git pull origin challe_v2.0
supervisorctl restart all
git pull origin challe_v2.0
supervisorctl restart all
nano .env
php artisan config:Clear
nano .env
php artisan optimize:clear
php artisan config:clear

nano .env
php artisan optimize:clear
php artisan config:clear
cd /var/www/html
git pull origin challe_v2.0
cd /var/www/html
git pull origin challe_v2.0
cd /var/www/html
git branch
git pull origin challe_v2.0
cd /var/www/html
git pull origin challe_v2.0
php artisan migrate