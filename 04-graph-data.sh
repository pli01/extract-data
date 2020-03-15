#!/bin/bash
set -e
echo "# generate data/data.png from data/data.txt"
docker run --rm -v $(pwd):/work remuslazar/gnuplot -c graph.gnuplot
exit 0
