#! /bin/bash

for htmlfile in $(ls *.html); do
	filename=$(basename $htmlfile .html)
	outfile="$filename.rst"
	pandoc --from=html --to=rst --output=$outfile $htmlfile;
done
