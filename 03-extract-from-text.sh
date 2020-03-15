#!/bin/bash
set -e

# source https://www.iledefrance.ars.sante.fr/coronavirus-covid-19-points-de-situation

# pdf saved in src
dst=dst
data=data
mkdir -p $data

echo "# generate $data/data.txt"
for txt in $dst/*.txt; do
 date=$(basename $txt .txt)
 value=$(grep Cela $txt | sed -e 's/.*Cela porte//g; s/le nombre de cas.*//g' | awk '{ print $2 }')
 echo "$date $value"
done | tee $data/data.txt

echo "# convert to $data/data.csv"
awk '{ print "\""$1"\""","$2 }' < data/data.txt > data/data.csv

echo "# convert to $data/data.json"
cat $data/data.txt |awk ' { printf("[\"%s\",%d]\n",$1,$2) } ' | sed '$!s/$/,/' |awk 'BEGIN{print "[ [\"index\",0],"} { print } END { print "]" } '  > $data/data.json 
exit 0
