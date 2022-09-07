#!/bin/sh
echo "Setting up server as per server.config...";
file=$(cat server.config)
for line in $file
do
    echo "line-> $line ...";
done
exit 0