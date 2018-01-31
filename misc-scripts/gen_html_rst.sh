#! /bin/bash

header=".. THIS FILE WAS GENERATED. DO NOT EDIT.\n"

for htmlfile in $(ls *.html); do
	filename=$(basename $htmlfile .html)
	outfile="$filename.rst"
	pandoc --from=html --to=rst --output=$outfile $htmlfile;
	echo -e $header | cat - $outfile > temp && mv temp $outfile
done
