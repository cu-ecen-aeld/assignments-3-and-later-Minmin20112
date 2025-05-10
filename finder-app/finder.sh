#!/bin/sh
#Author: MinhTT32
#Script follows here:

FILESDIR=$1
SEARCHSTR=$2

if [ -z $FILESDIR ] || [ -z $SEARCHSTR ]
then
	echo "One or all of the parameters above were not specified"
	exit 1
elif [ ! -d $FILESDIR ]
then
	echo "File directory is not represent a directory"
	exit 1
else
	NUMBERSOFFILE=$(find "$FILESDIR" -type f | wc -l)
	NUMBEROFMATCHINGLINE=$(grep -r "$SEARCHSTR" "$FILESDIR" 2>/dev/null | wc -l)
	echo "The number of files are $NUMBERSOFFILE and the number of matching lines are $NUMBEROFMATCHINGLINE"
	exit 0
fi
