#! /bin/bash

header=".. THIS FILE WAS GENERATED. DO NOT EDIT.\n"

for pdffile in $(ls *.pdf); do
	filename=$(basename $pdffile .pdf)
	outfile="$filename.rst"
	pandoc --from=pdf --to=rst --output=$outfile $pdffile;
	echo -e $header | cat - $outfile > temp && mv temp $outfile
done
