OqilaCMS Installation

1. $ cd {path of installation folder}
2. # git clone https://{bitbucket-username}@bitbucket.org/fazliddin2014/oqilacms.git {folder with project name}
3. Create database for project at phpMyadmin
4. Import /{folder with project name}/protected/migrations/oqilacms.sql
5. # cd /{folder with project name}/protected/config/
6. # cp db.php.dist db.php
7. Edit db.php, change db.name, db.user, db.password
8. # cp main-local.php.dist main-local.php
9. # cp params-local.php.dist params-local.php
10. Create file with name DEBUG at /{folder with project name} (This enables debug mode)
11. # chmod 0777 -R /{folder with project name}/protected/runtime (Linux only, this opens write access to that folder)
12. # chmod 0777 -R /{folder with project name}/public/assets
13. Apache's VirtualHost's DocumentRoot should point to /{folder with project name}/public folder
14. Login to admin: http://{your-domain}.loc/backend
login: admin
password: 12345678

Apache configuration on Linux
1. Create file /etc/apache2/sites-available/{folder with project name}.conf
2. Put this on that file
```
<VirtualHost *:80>
	ServerName {your-domain}.loc
	ServerAlias www.{your-domain}.loc

	ServerAdmin webmaster@localhost
	DocumentRoot /var/www/vhosts/{folder with project name}/public

	ErrorLog ${APACHE_LOG_DIR}/error.log
	CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
```
3. # sudo a2ensite {folder with project name}
4. # sudo service apache2 restart
5. Add following to /etc/hosts file
```
127.0.1.1	{your-domain}.loc
```