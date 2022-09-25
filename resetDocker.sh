#!/bin/sh
#Installig Docker
echo "Resetting Docker..."
git clone https://github.com/kameshX007/ResetDocker.git
cd ResetDocker;
sh resetDocker.sh;
cd ..
echo "Docker reset successfull..."
exit 0