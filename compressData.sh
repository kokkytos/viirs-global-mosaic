#!/bin/bash

###################################################################
#Script Name	: compressData.sh                                                                                              
#Description	: Compress output global VIIRS geotiffs                                                                                  
#Args           : Directory path with geotiffs                                                                                                                                                                                     
#Author       	: Leonidas Liakos                                               
#Email         	: lliakos@uth.gr
#Date         	: 05/2019
###################################################################

if [ "$1" != "" ]; then
    cd $1
else
    echo "Please provide a directory with monthly VIIRS masked tiles"
    exit 1
fi



for file in `ls *_vcmslcfg.avg_rade9h.Uint16.masked.tif`; do tar -czvf $file.tar.gz $file ; done
