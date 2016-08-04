#!/bin/sh

HHVM_VERSION=$1

mkdir -p ~/build/hhvm-mongodb
cd ~/build/hhvm-mongodb
wget https://github.com/mongodb/mongo-hhvm-driver/releases/download/${HHVM_VERSION}/hhvm-mongodb-${HHVM_VERSION}.tgz
tar -xzf hhvm-mongodb-${HHVM_VERSION}.tgz
cd hhvm-mongodb-${HHVM_VERSION}
hphpize
cmake .
make configlib
make install

echo "hhvm.dynamic_extensions[mongodb]=`pwd`/mongodb.so" >> /etc/hhvm/php.ini
