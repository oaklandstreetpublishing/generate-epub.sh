#!/bin/sh

# Bundles a properly formed folder into an ePub.
# Alex Lindeman / OSP, Inc.
# Last modified Aug 2 2012

# use first argument
NAME="$1"

if [ -z $NAME ]; then
	echo "usage: $0 <folder>"
	echo "please specify a folder to bundle"
	exit 1
fi

if [ ! -f $NAME ]; then
	echo "target folder $NAME does not exist, exiting"
	exit 1
fi

# remove old copy
rm "$NAME.epub"

# remove .DS_Stores and other useless files made by Finder
find . -name .DS_Store -exec rm {} \;
find . -name ._* -exec rm -f {} \;

# change directory
cd "$NAME"

# mimetype must be first item in the zip
zip -X0 "../$NAME.epub" mimetype

# add the rest of the files
zip -Xur9D "../$NAME.epub" *

echo "zip complete"

# go back to the old pwd
cd -

exit 0