#!/bin/sh
createServiceFile(){
    echo "Inside createServiceFile";
    echo "$1";
    if [ $1 = '1' ]
    then
        echo "Portainer.sh">>services && echo "GOt Portainer";;
    elif [ $1 = '2' ]
    then
        echo "Watchtower.sh">>services;
    elif [$1 = '3' ]
    then
        echo "FileBrowser.sh">>services;
    elif [$1 = '4' ]
    then
        echo "Qbittorrent.sh">>services;
    elif [$1 = '5' ]
    then
        echo "Jellyfin.sh">>services;
    elif [$1 = '6' ]
    then
        echo "CoadingWS.sh">>services;
    fi
}
deployContainers(){
    dockerContainers=$(sed -n '16p' server.config);
    git clone https://github.com/kameshX007/DockerDeployer.git
    cd DockerDeployer;
    rm -rf services;

    for word in $dockerContainers
    do
        createServiceFile $word;
    done

    echo "Executng service file";
    sh initiate.sh;
    cd ..;
    echo "Docker containers deployed successfully..."; 
}
noAutomation(){
    echo "Following containers are available to deploy";
    echo "1) Portainer";
    echo "2) Watchtower";
    echo "3) File Browser";
    echo "4) Qbittorrent";
    echo "5) Jellyfin";
    echo "6) CoadingWS";
    echo "";
    echo "Please enter the numbers seperated by space">>server.config;

    read x;
    if [ -z $x ]
    then
        echo "No containers selected, skipping docker container deployment";
    else
        echo "$x">>server.config;
    fi
}
#Deployig Docker containers
autoExecution=$1;
if [ -z $autoExecution ]
then
    noAutomation && deployContainers;
else
    deployContainers;
fi


exit 0