#!/bin/sh

#author:ahern88@163.com

NGINX_URL=http://nginx.org/download/nginx-1.4.7.tar.gz
PCRE_URL=http://ncu.dl.sourceforge.net/project/pcre/pcre/8.34/pcre-8.34.tar.gz

CURR_DIR=`pwd`

cd /var/

if [ ! -d './temp' ]; then
mkdir temp
fi

cd temp

wget ${PCRE_URL}
tar xzvf pcre-8.34.tar.gz
cd pcre-8.34
PCRE_DIR=`pwd`

echo "===============download nginx=============="
wget ${NGINX_URL}

echo "===============install nginx============="
tar xzf nginx-1.4.7.tar.gz
cd nginx-1.4.7
./configure --prefix=/usr/local/nginx --with-pcre=${PCRE_DIR}
make && make install


rm /var/temp -rf
cd ${CURR_DIR}
~