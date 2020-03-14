#!/bin/bash

# source https://www.iledefrance.ars.sante.fr/coronavirus-covid-19-points-de-situation

# pdf saved in src
src=src
dst=dst
mkdir -p $dst

for pdf in $src/*.pdf; do
 echo $pdf
 txt="$(basename $pdf .pdf).txt"
 # convert
 [ -f $pdf ] && [ ! -f "$dst/$txt" ] && docker run --rm -i kalledk/pdftotext < $pdf > $dst/$txt
done
