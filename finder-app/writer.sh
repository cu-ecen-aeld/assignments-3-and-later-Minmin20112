#!/bin/sh
#Author: MinhTT32
#Script follows here:

WRITEFILE=$1
WRITESTR=$2

if [ -z $WRITEFILE ] || [ -z $WRITESTR ]
then
	echo "One or all of the parameters above were not specified"
	exit 1
else
	DIRPATH=$(dirname "$WRITEFILE")
	mkdir -p "$DIRPATH"
	echo "$WRITESTR" > "$WRITEFILE"
	
	if [ $? -ne 0 ]; then
	echo "Error: Could not write to file"
	exit 1
	fi
	
	exit 0
fi

