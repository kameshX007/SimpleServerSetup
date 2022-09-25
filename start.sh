#!/bin/sh
#ucaresystem-core
echo "Do you want to install & run ucaresystem-core ? [y/N] (It is an all-in-one System Update and maintenance tool"
echo "It will update, upgrade, clean unnecessary packages and data from server)"
read x;
if [[ "$x" == "y" || "$x" == "Y" ]]
then
    sh systemUpdate.sh;
fi

#Changing date to given timestamp
echo "Do you want to change system date as per your timezone ? [y/N]";
read x;
if [[ "$x" == "y" || "$x" == "Y" ]]
then
    sh systemDateUpdate.sh;
fi

#Installing apps
echo "Do you want to install new apps ? [y/N]";
read x;
if [[ "$x" == "y" || "$x" == "Y" ]]
then
    sh appInstallation.sh;
fi

#Installig Docker
echo "Do you want to install Docker ? [y/N]";
read x;
if [[ "$x" == "y" || "$x" == "Y" ]]
then
    sh dockerInstallation.sh;
fi

#Docker Reset
echo "Do you want to Reset Docker ? [y/N]";
echo "Removing everything to begin with a fresh star";
read x;
if [[ "$x" == "y" || "$x" == "Y" ]]
then
    sh resetDocker.sh;
fi

#Deployig Docker containers
echo "Do you want to deploy Docker containers ? [y/N]";
read x;
if [[ "$x" == "y" || "$x" == "Y" ]]
then
    sh deployDockerContainers.sh;
fi

echo "Server setup has been completed successfully...";
exit 0;