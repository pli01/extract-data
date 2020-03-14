#!/bin/bash
docker run --rm -v $(pwd):/work remuslazar/gnuplot -c graph.gnuplot

