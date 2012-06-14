

=====INSTALLATION INSTRUCTION=====

1. chmod 777 (write permission) to
application/cache (all files in this)
application/log (all files in this)
public/upload/ (all folders, subfolders, files in this)
public/themes
modules

2. import "agni.sql" into your mysql database.

3. config database in
application/config/database.php

4. config some settings about hash text, cookie prefix, cookie domain, ...more in
application/config/config.php


=====TEST=====

browse URL to your install path.
eg. http://localhost

log in with this username and password
username: admin
password: pass
