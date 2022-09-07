#!/bin/sh
#config check
echo "Welcome to s3 (Simple Server Setup)...";
echo "Do you have server.config file ? [y/N] (s3 will folow the file and setup server accordingy)";
read x;
if [ -z $x ]
then
    configAvailable="N";
elif [ $x = 'y' ]
then
    configAvailable="Y";
elif [ $x = 'Y' ]
then
    configAvailable="Y";
else
    configAvailable="N";
fi

if [ $configAvailable = 'Y' ]
then
    sh executeAsPerConfig.sh && echo "Server setup has been completed successfully..." && exit 0;
fi

#ucaresystem-core
echo "Do you want to install & run ucaresystem-core ? [y/N] (It is an all-in-one System Update and maintenance tool"
echo "It will update, upgrade, clean unnecessary packages and data from server)"
echo "Do you want to install & run ucaresystem-core ? [y/N]">server.config
read x;
if [ -z $x ]
then
    echo "N">>server.config;
elif [ $x = 'y' ]
then
    echo "Y">>server.config && sh systemUpdate.sh;
elif [ $x = 'Y' ]
then
    echo "Y">>server.config && sh systemUpdate.sh;
else
    echo "N">>server.config;
fi

#Changing date to given timestamp
echo "Do you want to change system date as per your timezone ? [y/N]";
echo "Do you want to change system date as per your timezone ? [y/N]">>server.config
read x;
if [ -z $x ]
then
    echo "N">>server.config && echo "">>server.config && echo "">>server.config;
elif [ $x = 'y' ]
then
    echo "Y">>server.config && sh systemDateUpdate.sh;
elif [ $x = 'Y' ]
then
    echo "Y">>server.config && sh systemDateUpdate.sh;
else
    echo "N">>server.config && echo "">>server.config && echo "">>server.config;
fi

#Installing apps
echo "Do you want to install new apps ? [y/N]";
echo "Do you want to install new apps ? [y/N]">>server.config
read x;
if [ -z $x ]
then
    echo "N">>server.config && echo "">>server.config && echo "">>server.config;
elif [ $x = 'y' ]
then
    echo "Y">>server.config && sh appInstallation.sh;
elif [ $x = 'Y' ]
then
    echo "Y">>server.config && sh appInstallation.sh;
else
    echo "N">>server.config && echo "">>server.config && echo "">>server.config;
fi

#Installig Docker
echo "Do you want to install Docker ? [y/N]";
echo "Do you want to install Docker ? [y/N]">>server.config
read x;
if [ -z $x ]
then
    echo "N">>server.config;
elif [ $x = 'y' ]
then
    echo "Y">>server.config && sh dockerInstallation.sh;
elif [ $x = 'Y' ]
then
    echo "Y">>server.config && sh dockerInstallation.sh;
else
    echo "N">>server.config;
fi

#Deployig Docker containers
echo "Do you want to deploy Docker containers ? [y/N]";
echo "Do you want to deploy Docker containers ? [y/N]">>server.config
read x;
if [ -z $x ]
then
    echo "N">>server.config;
elif [ $x = 'y' ]
then
    echo "Y">>server.config && sh deployDockerContainers.sh;
elif [ $x = 'Y' ]
then
    echo "Y">>server.config && sh deployDockerContainers.sh;
else
    echo "N">>server.config;
fi

echo "Server setup has been completed successfully...";
exit 0;