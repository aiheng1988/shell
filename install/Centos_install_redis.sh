#!/bin/sh

# author: ahern88@163.com

REDIS_URL=http://download.redis.io/releases/redis-2.8.8.tar.gz

CURR_DIR=`pwd`

cd /var/

if [ ! -d './temp' ]; then
mkdir temp
fi

cd temp

echo "===============download redis=============="
wget ${REDIS_URL}

echo "===============install redis============="
tar xzf redis-2.8.8.tar.gz
cd redis-2.8.8
make

if [ ! -d '/usr/local/redis/bin' ]; then
mkdir -p /usr/local/redis/bin
fi

cp src/redis-* /usr/local/redis/bin
cp redis.conf /usr/local/redis/
rm /usr/local/redis/bin/*.c -f
rm /usr/local/redis/bin/*.o -f

if grep 'redis path' /etc/profile > /dev/null
then
echo "path is really ok!"
else
cat << EOF >> /etc/profile
# redis path
REDIS_HOME=/usr/local/redis
PATH=\$PATH:\$REDIS_HOME/bin
export REDIS_HOME
export PATH
EOF
fi