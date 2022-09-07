#!/bin/sh
createServiceFile(){
    
    [ $1 = '1' ] && echo "Portainer.sh">>services;
    [ $1 = '2' ] && echo "Watchtower.sh">>services;
    [ $1 = '3' ] && echo "FileBrowser.sh">>services;
    [ $1 = '4' ] && echo "Qbittorrent.sh">>services;
    [ $1 = '5' ] && echo "Jellyfin.sh">>services;
    [ $1 = '6' ] && echo "CoadingWS.sh">>services;
    
}
deployContainers(){
    dockerContainers=$(sed -n '18p' server.config);
    dockerUser=$(sed -n '20p' server.config);
    git clone https://github.com/kameshX007/DockerDeployer.git
    cd DockerDeployer;
    rm -rf services;
    
    for word in $dockerContainers
    do
        createServiceFile $word;
    done

    sh initiate.sh $dockerUser;
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
    echo "Please enter the numbers seperated by space";
    echo "Please enter the numbers seperated by space">>server.config;

    read x;
    if [ -z $x ]
    then
        echo "No containers selected, skipping docker container deployment";
    else
        echo "$x">>server.config;
    fi

    echo "Please enter the username";
    echo "We will create a docker folder inside this users home directory to store the docker persistant volume"
    echo "Please enter the username">>server.config;

    read x;
    if [ -z $x ]
    then
        echo "No Username entered, defaulting to ubuntu" && echo "ubuntu">>server.config;
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