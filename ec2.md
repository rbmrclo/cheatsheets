# EC2

#### Bootstrap scripts

```
#!/bin/bash
yum update -y
yum install httpd24 -y
service httpd start
chkconfig httpd on
echo "<html><body><h1> Hello from (enter any instance identifier here i.e region, vpc, etc...) </h1></body></html>" > /var/www/html/index.html
```
