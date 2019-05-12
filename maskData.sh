#!/bin/bash

###################################################################
#Script Name	: maskData.sh                                                                                              
#Description	: Masks data with DMSP OLS
#Args           : Directory path with monthly VIIRS tiles, Directory path with OLS tiles                                                                               
#Author       	: Leonidas Liakos                                               
#Email         	: lliakos@uth.gr
#Date         	: 05/2019
###################################################################


if [ "$1" != "" ]; then
    cd $1
else
    echo "Please provide a directory with monthly VIIRS tiles"
    exit 1
fi

if [ "$2" != "" ]; then
    OLS_PATH="$2"
else
    echo "Please provide a directory for DMPS/OLS geotiffs"
    exit 1
fi



######### SETTINGS ################################################


# ************** VIIRS *******************************************
Tile1="*_75N180W_*Uint16.tif"
Tile2="*_75N060W_*Uint16.tif"
Tile3="*_75N060E_*Uint16.tif"
Tile4="*_00N180W_*Uint16.tif"
Tile5="*_00N060W_*Uint16.tif"
Tile6="*_00N060E_*Uint16.tif"


# ************** OLS **********************************************


OLS_TILE1="ols_masked_T1.tif_Uint16_bin.tif"
OLS_TILE2="ols_masked_T2.tif_Uint16_bin.tif"
OLS_TILE3="ols_masked_T3.tif_Uint16_bin.tif"
OLS_TILE4="ols_masked_T4.tif_Uint16_bin.tif"
OLS_TILE5="ols_masked_T5.tif_Uint16_bin.tif"
OLS_TILE6="ols_masked_T6.tif_Uint16_bin.tif"




function_mask () {
   	gdal_calc.py --co COMPRESS=LZW --co PREDICTOR=2 --co="TILED=YES" \
	--overwrite \
	--debug \
	-A $1 \
	-B "$OLS_PATH/$2" \
	--outfile="$1"_masked.tif \
	--calc="A*B"
} 


###################################################################

COUNTER=1
   
# ########### Tile1
for f in `echo $Tile1`;do
	echo " --------- FILE: $COUNTER ----------------------------"	
	function_mask $f $OLS_TILE1
	COUNTER=$((COUNTER+1))
done


########## TILE2
for f in `echo $Tile2`;do
	echo " --------- FILE: $COUNTER ----------------------------"	
	function_mask $f $OLS_TILE2

	
	COUNTER=$((COUNTER+1))
done



######### TILE3
for f in `echo $Tile3`;do
	echo " --------- FILE: $COUNTER ----------------------------"	
	function_mask $f $OLS_TILE3
	COUNTER=$((COUNTER+1))
done



######### TILE4
for f in `echo $Tile4`;do
	echo " --------- FILE: $COUNTER ----------------------------"	
	function_mask $f $OLS_TILE4
	COUNTER=$((COUNTER+1))
done



######### TILE5
for f in `echo $Tile5`;do
	echo " --------- FILE: $COUNTER ----------------------------"	
	function_mask $f $OLS_TILE5
	COUNTER=$((COUNTER+1))
done



######### TILE6
for f in `echo $Tile6`;do
	echo " --------- FILE: $COUNTER ----------------------------"	
	function_mask $f $OLS_TILE6
	COUNTER=$((COUNTER+1))
done




