# EC2

#### Bootstrap scripts

For testing Route53

```
#!/bin/bash
yum update -y
yum install httpd24 -y
service httpd start
chkconfig httpd on
echo "<html><body><h1> Hello from (enter any instance identifier here i.e region, vpc, etc...) </h1></body></html>" > /var/www/html/index.html
```

For testing RDS (mysql)

```
#!/bin/bash
yum install httpd php php-mysql -y
yum update -y
chkconfig httpd on
service httpd start
echo "<?php phpinfo();?>" > /var/www/html/index.php
cd /var/www/html
wget https://s3.eu-west-2.amazonaws.com/<bucket_name>/connect.php
```

For testing apache (basically just to check when the instance is alive and
apache was successfully installed)

```
#!/bin/bash
yum install httpd -y
yum update -y
service httpd start
chkconfig httpd on
echo "<html><h1>Hello from the other side!</h1></html>" > /var/www/html/index.html
```
