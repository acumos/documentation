#! /bin/bash

for docxfile in $(ls *.docx); do
	filename=$(basename $docxfile .docx)
	outfile="$filename.rst"
	pandoc --from=docx --to=rst --output=$outfile $docxfile;
done
