#!/bin/sh
#Installig Docker
echo "Installig Docker..."
git clone https://github.com/kameshX007/installDocker.git;
cd installDocker;
sh installDocker.sh;
cd ..
echo "Docker installed successfully..."
exit 0