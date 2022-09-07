#!/bin/sh
#Installing apps
installApps(){
    echo "Please enter app names seperated by space";
    read x;
    if [ -z $x ]
    then
        echo "No value entered, not installing any app";
    else
        echo "Installing $x ..." && apt -y update && apt-get -y install $x && echo "App Installation completed successfully...";
    fi
    echo "Please enter app names seperated by space">>server.config;
    echo "$x">>server.config;  
}
x=$1;
if [ -z $x ]
then
    installApps;
else
    echo "Installing $x ..." && apt -y update && apt-get -y install $x && echo "App Installation completed successfully...";
fi
exit 0