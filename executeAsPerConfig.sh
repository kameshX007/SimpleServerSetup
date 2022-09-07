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
if [ $configData = 'Y' ]
then
    sh appInstallation.sh nano;
fi

#Installig Docker
configData=$(sed -n '12p' server.config);
if [ $configData = 'Y' ]
then
    sh dockerInstallation.sh;
fi

#Reset Docker
configData=$(sed -n '14p' server.config);
if [ $configData = 'Y' ]
then
    sh ResetDocker.sh;
fi

#Deployig Docker containers
configData=$(sed -n '16p' server.config);
if [ $configData = 'Y' ]
then
    sh deployDockerContainers.sh auto;
fi

exit 0