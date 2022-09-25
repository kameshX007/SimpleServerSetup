#!/bin/sh
createServiceFile(){
    
    [ $1 = '1' ] && echo "Portainer.sh">>services;
    [ $1 = '2' ] && echo "Watchtower.sh">>services;
    [ $1 = '3' ] && echo "FileBrowser.sh">>services;
    [ $1 = '4' ] && echo "Qbittorrent.sh">>services;
    [ $1 = '5' ] && echo "Jellyfin.sh">>services;
    
}
getUserName(){
    echo "Please enter the username";
    echo "We will create a docker folder inside this users home directory to store the docker persistant volume"

    read x;
    if [ -z $x ]
    then
        echo "No Username entered, defaulting to ubuntu" && dockerUser = "ubuntu";
    else
        dockerUser = $x;
    fi
}

deploySelectedContainers(){
    #Installing selected containers
    git clone https://github.com/kameshX007/DockerDeployer.git
    cd DockerDeployer;
    rm -rf services;

    for word in $dockerContainers
    do
        createServiceFile $word;
    done

    sh initiate.sh $dockerUser;
    echo "Docker containers deployed successfully..."; 
}

#Deployig Docker containers
echo "Following containers are available to deploy";
echo "1) Portainer";
echo "2) Watchtower";
echo "3) File Browser";
echo "4) Qbittorrent";
echo "5) Jellyfin";
echo "";
echo "Please enter the numbers seperated by space";

read x;
if [ -z $x ]
then
    echo "No containers selected, skipping docker container deployment";
else
    dockerContainers = $x && getUserName && deploySelectedContainers;
fi

exit 0