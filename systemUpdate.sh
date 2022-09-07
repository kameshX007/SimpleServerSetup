#!/bin/sh
#Installing ucaresystem-core
echo "Installing ucaresystem-core...";
apt -y install software-properties-common;
add-apt-repository -y ppa:utappia/stable;
apt-get -y install ucaresystem-core;
echo "Ucaresystem-core installed successfully...";

#Running ucaresystem-core
echo "Running Ucaresystem-core...";
ucaresystem-core;
echo "Ucaresystem-core run completed successfully...";
exit 0