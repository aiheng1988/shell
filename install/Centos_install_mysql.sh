#!/bin/sh

wget http://dev.mysql.com/get/Downloads/MySQL-5.6/MySQL-5.6.21-1.el6.i686.rpm-bundle.tar
tar -xvf MySQL-5.6.21-1.el6.i686.rpm-bundle.tar
#rpm -qa | grep mysql | xargs rpm --nodeps -e
yum install gcc g++ -y
rpm -ivh MySQL-shared-5.6.21-1.el6.i686.rpm
yum install libaio -y
rpm -ivh MySQL-devel-5.6.21-1.el6.i686.rpm
rpm -ivh MySQL-embedded-5.6.21-1.el6.i686.rpm
yum install perl -y
rpm -ivh MySQL-client-5.6.21-1.el6.i686.rpm
rpm -ivh MySQL-test-5.6.21-1.el6.i686.rpm
rpm -ivh MySQL-server-5.6.21-1.el6.i686.rpm

PWD=`cat /root/.mysql_secret | awk -F ': ' '{print $2}'`

service mysql start

mysqladmin -uroot -p$PWD password 'ahern88'

service mysql stop

sudo -u mysql mysqld install

chkconfig mysql on

service mysql restart
