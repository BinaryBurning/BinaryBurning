#!/bin/bash
yum update -y
yum install -y httpd
systemctl enable httpd
systemctl start httpd

echo "<h1>Hello from EC2 - Built by Bilal</h1>" > /var/www/html/index.html
