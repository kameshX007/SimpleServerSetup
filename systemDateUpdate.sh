#!/bin/sh
#Changing date to given timestamp
echo "Please enter the timezone (e.g. 'Asia/Kolkata')";
echo "Please be cautious and enter in correct format like Asia/Kolkata";
echo "else it can break the flow";
read x;
if [ -z $x ]
then
    echo "No value entered, defaulting to Asia/Kolkata" && x="Asia/Kolkata";
else
    echo "Changing date to $x timezone...";
fi
echo "Please enter the timezone (e.g. 'Asia/Kolkata')">>server.config
echo "$x">>server.config
unlink /etc/localtime;
ln -s /usr/share/zoneinfo/$x /etc/localtime;
exit 0