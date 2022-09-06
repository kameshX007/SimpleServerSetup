#!/bin/sh
#Installing Neofetch, Htop, Nano
echo "Installing Neofetch, Htop, Nano...">InitialServerSetup.log;
apt -y update;
apt-get -y install neofetch htop nano;

#Changing date to IST
unlink /etc/localtime;
ln -s /usr/share/zoneinfo/Asia/Kolkata /etc/localtime;

#Installing ucaresystem-core
echo "Installing ucaresystem-core...">>InitialServerSetup.log;
apt -y install software-properties-common;
add-apt-repository -y ppa:utappia/stable;
apt-get -y install ucaresystem-core;

#Running ucaresystem-core
echo "Running ucaresystem-core...">>InitialServerSetup.log;
ucaresystem-core;
echo "Initial Setup Done...">>InitialServerSetup.log;
exit 0
