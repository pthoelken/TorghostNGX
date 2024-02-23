#!/bin/bash

strBuildDirectory=target
objPythonVersion=$(python3 -V | cut -d' ' -f2 | cut -d'.' -f1,2)

if [ -d $strBuildDirectory ]; then
    rm -rf $strBuildDirectory
    mkdir $strBuildDirectory
    cd $strBuildDirectory
fi

function main() {
    apt update
    apt install tor python3-pip cython3 -y
    pip3 install -r requirements.txt
    cython3 -3 ../torghost.py --embed -o torghost.c --verbose
    gcc -Os -I /usr/include/python${objPythonVersion} -o torghost torghost.c -lpython${objPythonVersion} -lpthread -lm -lutil -ldl
}

main
exit 0