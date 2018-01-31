#! /bin/bash

for mdfile in $(ls *.md); do
	filename=$(basename $mdfile .md)
	outfile="$filename.rst"
	pandoc --from=markdown --to=rst --output=$outfile $mdfile;
done
