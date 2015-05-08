#!/bin/bash

conda remove system
time wget -nv --no-check-certificate http://root.cern.ch/download/root_v${ROOT}.source.tar.gz
tar xfz root_v${ROOT}.source.tar.gz
cd root*
python-config --configdir --includes --cflags --ldflags --exec-prefix
ln -s `python-config --exec-prefix`/lib/libpython3.4m.so `python3.4-config --exec-prefix`/lib/libpython3.4.so
./configure --with-python-incdir=`python-config --exec-prefix`/include/python3.4m --with-python-libdir=`python-config --exec-prefix`/lib
cat config.log

echo making ROOT...

make -j2

echo source ROOT environment...

source bin/thisroot.sh

cd ..