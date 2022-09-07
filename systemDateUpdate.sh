#!/bin/sh
changeDate(){
    echo "Please enter the timezone (default 'Asia/Kolkata')";
    echo "Please be cautious and enter in correct format like Asia/Kolkata";
    read x;
    if [ -z $x ]
    then
        echo "No value entered, defaulting to Asia/Kolkata" && x="Asia/Kolkata";
    else
        echo "Changing date to $x timezone...";
    fi
    echo "Please enter the timezone (default 'Asia/Kolkata')">>server.config
    echo "$x">>server.config
}
#Changing date to given timestamp
x=$1;
if [ -z $x ]
then
    changeDate;
else
    echo "Changing date to $x timezone...";
fi

unlink /etc/localtime;
ln -s /usr/share/zoneinfo/$x /etc/localtime;
exit 0

