#!/bin/bash

###################################################################
#Script Name	: downloadData.sh                                                                                              
#Description	: Download files from a list of URLs in file                                                                              
#Args           : File path with URLS, A directory to download monthly VIIRS                                                                                       
#Author       	: Leonidas Liakos                                               
#Email         	: lliakos@uth.gr
#Date         	: 05/2019
###################################################################


if [ "$1" != "" ]; then
    FILENAME=$1
else
    echo "Please provide a file with URLS of VIIRS tgz files"
    exit 1
fi


if [ "$2" != "" ]; then
    cd $2
else
    echo "Please provide a directory to download monthly VIIRS masked tiles"
    exit 1
fi


while IFS='' read -r line || [[ -n "$line" ]]; do
    wget --continue $line
done < "$FILENAME"
