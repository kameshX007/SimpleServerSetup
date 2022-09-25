#!/bin/sh
#Installing ucaresystem-core
echo "Installing ucaresystem-core...";
sudo apt update -y;
sudo apt -y install software-properties-common;
sudo add-apt-repository -y ppa:utappia/stable;
sudo apt-get -y install ucaresystem-core;
echo "Ucaresystem-core installed successfully...";

#Running ucaresystem-core
echo "Running Ucaresystem-core...";
sudo ucaresystem-core;
echo "Ucaresystem-core run completed successfully...";
exit 0