#!/bin/sh
echo "Setting up server as per server.config...";

#ucaresystem-core
configData=$(sed -n '2p' server.config);
if [ $configData = 'Y' ]
then
    sh systemUpdate.sh;
fi

#Changing date to given timestamp
configData=$(sed -n '4p' server.config);
selectedTimezone=$(sed -n '6p' server.config);
if [ $configData = 'Y' ]
then
    sh systemDateUpdate.sh $selectedTimezone;
fi

##Installing apps
configData=$(sed -n '8p' server.config);
selectedApps=$(sed -n '10p' server.config);
if [ $configData = 'Y' ]
then
    sh appInstallation.sh $selectedApps;
fi

#Installig Docker
configData=$(sed -n '12p' server.config);
if [ $configData = 'Y' ]
then
    sh dockerInstallation.sh;
fi

exit 0