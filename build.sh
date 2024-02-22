#!/bin/bash -e

sudo apt-get install tor python3-pip cython3 -y 
sudo pip3 install -r requirements.txt 
mkdir build && cd build

py3_version=$(python3 -V | cut -d' ' -f2 | cut -d'.' -f1,2)

cython3 ../torghost.py --embed -o torghost.c --verbose
gcc -Os -I /usr/include/python${py3_version} -o torghost torghost.c -lpython${py3_version} -lpthread -lm -lutil -ldl
sudo cp -r torghost /usr/bin/
chmod +x /usr/bin/torghost