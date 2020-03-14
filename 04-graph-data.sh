#!/bin/bash
set -e
echo "# generate data/data.png"
docker run --rm -v $(pwd):/work remuslazar/gnuplot -c graph.gnuplot
exit 0
