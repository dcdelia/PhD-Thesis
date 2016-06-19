reset
set terminal x11
#set key on at 9.5,120 maxrows 1 samplen 3
set key outside right center invert maxcols 1 samplen 3 font ",16" height 1 spacing 1.5
set title "Breakdown of feasible OSR points (f_{opt}{/Symbol \256} f_{base})" font ",20"
set ylabel "Program points (%)"
set xrange [-0.75:11.75]
set yrange [0:100]
set mytics 2
set grid ytics mytics
set style data histogram
set xtic rotate by -45 scale 0 font ",14"
set style histogram rowstacked
set style fill solid 1.0 border rgb "#000000"
set boxwidth 0.5
set size 1,0.75
set grid
set grid noxtics

load "palette-new.p"

plot \
     'data/opt-to-base.csv' using (100*$3/$2):xtic(1) t '{/Symbol c = \341 \361}' fs ls 6,\
     '' using (100*$5/$2) t 'live' fs ls 5,\
     '' using (100*$6/$2) t 'live_{(e)}' fs ls 4,\
     '' using (100*$8/$2) t 'avail' fs ls 2

set terminal postscript eps color enhanced dashed "Helvetica" 16
set output 'out/opt-to-base.eps'
replot
