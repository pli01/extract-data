#!/bin/bash

# source https://www.iledefrance.ars.sante.fr/coronavirus-covid-19-points-de-situation

# pdf saved in src
dst=dst
data=data
mkdir -p $data

for txt in $dst/*.txt; do
 date=$(basename $txt .txt)
 value=$(grep Cela $txt | sed -e 's/.*Cela porte//g; s/le nombre de cas.*//g' | awk '{ print $2 }')
 echo "$date $value"
done | tee $data/data.txt
