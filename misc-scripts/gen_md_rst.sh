#! /bin/bash

header=".. THIS FILE WAS GENERATED. DO NOT EDIT.\n"

for mdfile in $(ls *.md); do
	filename=$(basename $mdfile .md)
	outfile="$filename.rst"
	pandoc --from=markdown --to=rst --output=$outfile $mdfile;
	echo -e $header | cat - $outfile > temp && mv temp $outfile
done
