#! /bin/bash

header=".. THIS FILE WAS GENERATED. DO NOT EDIT.\n"

for docxfile in $(ls *.docx); do
	filename=$(basename $docxfile .docx)
	outfile="$filename.rst"
	pandoc --from=docx --to=rst --output=$outfile $docxfile;
	echo -e $header | cat - $outfile > temp && mv temp $outfile
done
