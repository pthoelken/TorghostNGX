#!/bin/bash

strBuildDirectory=build
objPythonVersion=$(python3 -V | cut -d' ' -f2 | cut -d'.' -f1,2)

if [ -d $strBuildDirectory ]; then
    rm -rf $strBuildDirectory
    mkdir $strBuildDirectory
    cd $strBuildDirectory
fi

if [ "$EUID" -ne 0 ]; then 
    echo "[ERROR] Operation $1 was not successfull!"
    exit 1
fi

function ProgressCheck() {
    if [ $? -eq 0 ]; then
        echo -e "[SUCCESS] Operation | $1 | was successfull!"
    else
        echo -e "[ERROR] Operation | $1 | was not successfull!"
        exit 1
    fi
}

function main() {
    apt update
    ProgressCheck "Repository Update"

    apt install tor python3-pip cython3 -y
    ProgressCheck "Install System requirements"

    pip3 install -r requirements.txt 
    ProgressCheck "Install Python requirements"

    cython3 -3 ../torghost.py --embed -o torghost.c --verbose
    ProgressCheck "Generate C Code"

    gcc -Os -I /usr/include/python${objPythonVersion} -o torghost torghost.c -lpython${objPythonVersion} -lpthread -lm -lutil -ldl
    ProgressCheck "Compiled to static binary"

    sudo cp -r torghost /usr/bin/
    chmod +x /usr/bin/torghost
    ProgressCheck "Install to /usr/bin/ and make it executable"
}

main
exit 0