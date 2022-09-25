#!/bin/sh
#Changing date to given timestamp
echo "Please enter the timezone (default 'Asia/Kolkata')";
echo "Please be cautious and enter in correct format like Asia/Kolkata";
read x;
if [ -z $x ]
then
    echo "No value entered, defaulting to Asia/Kolkata" && x="Asia/Kolkata";
else
    echo "Changing date to $x timezone...";
fi

sudo unlink /etc/localtime;
sudo ln -s /usr/share/zoneinfo/$x /etc/localtime;
exit 0