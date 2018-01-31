#! /bin/bash
for pdffile in $(ls *.pdf); do
	filename=$(basename $pdffile .pdf)
	outfile="$filename.rst"
	pandoc --from=pdf --to=rst --output=$outfile $pdffile;
done
