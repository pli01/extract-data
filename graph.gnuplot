reset
clear
set xlabel 'Date' rotate by 90
set ylabel 'Nb cas'
set grid
set xdata time
set format x "%Y-%m-%d"
set timefmt "%Y-%m-%d"
set title 'Evolution IDF'
set term png medium size 800,600
set output 'data/data.png'
plot  "data/data.txt" using 1:2 with boxes
