#!/bin/bash

###################################################################
#Script Name	: float2int.sh                                                                                              
#Description	: Batch Convert Float VIIRS geotiffs to Uint16                                                                               
#Args           : Directory path with geotiffs                                                                                          
#Author       	: Leonidas Liakos                                               
#Email         	: lliakos@uth.gr                                          
#Date         	: 05/2019
###################################################################


if [ "$1" != "" ]; then
    cd $1
else
    echo "Please provide a directory with monthly VIIRS geotiffs"
    exit 1
fi



for f in *.tif;do
	gdal_translate -ot UInt16 -of GTiff -co COMPRESS=LZW -co PREDICTOR=2 -co TILED=YES "$f" "$f"_Uint16.tif
done


