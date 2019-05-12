#!/bin/bash

###################################################################
#Script Name	: extractData.sh                                                                                              
#Description	: Batch Extraction of avg_rade9h* tiffs from tgz VIIRS files.                                                                                 
#Args           : Directory path with VIIRS tgz files                                                                                          
#Author       	: Leonidas Liakos                                               
#Email         	: lliakos@uth.gr
#Date         	: 05/2019
###################################################################


if [ "$1" != "" ]; then
    cd $1
else
    echo "Please provide a directory with VIIRS tgz files"
    exit 1
fi



for f in *.tgz;do
	pv "$f" | tar -xvzf -  --wildcards --no-anchored '*avg_rade9h*' 
done
