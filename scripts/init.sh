#!/bin/bash
# install redis-cli
sudo apt-get -y install build-essential
wget http://download.redis.io/redis-stable.tar.gz
tar xvzf redis-stable.tar.gz
cd redis-stable
make redis-cli
sudo cp src/redis-cli /usr/local/bin/

#install mmemtier bechmark
sudo apt-get update
sudo apt-get -y install build-essential autoconf automake libpcre3-dev libevent-dev pkg-config zlib1g-dev libssl-dev
git clone https://github.com/RedisLabs/memtier_benchmark
cd memtier_benchmark/
autoreconf -ivf
PKG_CONFIG_PATH=/usr/local/opt/openssl@1.1/lib/pkgconfig ./configure
make
sudo make install

echo "redis-cliand memtier-benchmark has been installed" > /home/out.txt