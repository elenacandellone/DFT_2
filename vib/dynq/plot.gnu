set size 0.8, 0.8

set xlabel "Smearing" font "Times New Roman, 30" 
set ylabel "Energy/atom (Ryd)" font "Times New Roman, 30 "
set tics font "Times New Roman, 20" 


plot "freq.dat" using 2:3 index 1 with lines title "k=10",\
"freq.dat" using 2:3 index 2 with lines title "k=12",\
"freq.dat" using 2:3 index 3 with lines title "k=14",\
"freq.dat" using 2:3 index 4 with lines title "k=16"\
"freq.dat" using 2:3 index 5 with lines title "k=18"\
