#!/bin/bash

###################################################################
#Script Name	: mosaic.sh                                                                                              
#Description	: Mosaic monthly VIIRS masked tiles                                                                                 
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



function_mosaic () {
	output=$(ls -t $1 | head -n 1 | cut -d'_' -f1-3)"_vcmslcfg.avg_rade9h.Uint16.masked.tif"
	mosaic=$output".vrt"
	echo $(ls $1)
	gdalbuildvrt -overwrite $mosaic $(ls $1)
	gdal_translate -co COMPRESS=LZW -co PREDICTOR=2 -co TILED=YES $mosaic $output
	rm $mosaic
} 


function_mosaic "SVDNB_npp_201*0101-201*0131_*.*Uint16.tif_masked.tif"
function_mosaic "SVDNB_npp_201*0201-201*022*_*.*Uint16.tif_masked.tif"
function_mosaic "SVDNB_npp_201*0301-201*0331_*.*Uint16.tif_masked.tif"
function_mosaic "SVDNB_npp_201*0401-201*0430_*.*Uint16.tif_masked.tif"
function_mosaic "SVDNB_npp_201*0501-201*0531_*.*Uint16.tif_masked.tif"
function_mosaic "SVDNB_npp_201*0601-201*0630_*.*Uint16.tif_masked.tif"
function_mosaic "SVDNB_npp_201*0701-201*0731_*.*Uint16.tif_masked.tif"
function_mosaic "SVDNB_npp_201*0801-201*0831_*.*Uint16.tif_masked.tif"
function_mosaic "SVDNB_npp_201*0901-201*0930_*.*Uint16.tif_masked.tif"
function_mosaic "SVDNB_npp_201*1001-201*1031_*.*Uint16.tif_masked.tif"
function_mosaic "SVDNB_npp_201*1101-201*1130_*.*Uint16.tif_masked.tif"
function_mosaic "SVDNB_npp_201*1201-201*1231_*.*Uint16.tif_masked.tif"



