reset
load "palette.p"
set terminal x11
#set key on top center outside maxrows 1
set key on at 11.52,117.5 maxrows 1 samplen 3 font ",16"
set title "Breakdown of feasible OSR points (f_{base}{/Symbol \256} f_{opt})" offset 0,2 font ",20"
set ylabel "Program points (%)"
set xrange [-0.75:11.75]
set yrange [0:100]
set mytics 2
set grid ytics mytics
set style data histogram
set xtic rotate by -45 scale 0 font ",14"
#set style histogram rowstacked title offset 0,-1
set style histogram rowstacked
set style fill solid 1.0 border rgb "#000000"
load "palette.p"
set boxwidth 0.5
set size 1,0.75
#set size 1,0.66
set grid y
set grid noxtics

plot \
    'data/base-to-opt.csv' using (100*$3/$2):xtic(1) t '{/Symbol c = \341 \361}' fs ls 2,\
     '' using (100*$5/$2) t 'live' fs ls 3,\
     '' using (100*$6/$2) t 'live_{(e)}' fs ls 4,\
     '' using (100*$7/$2) t 'alias' fs ls 5, \
     '' using (100*$8/$2) t 'avail' fs ls 6, \

set terminal postscript eps color enhanced dashed "Helvetica" 16
set output 'out/base-to-opt.eps'
replot
#system "ps2eps -B tmp/false-cold-hot-noBB.eps; mv tmp/false-cold-hot-noBB.eps.eps ../false-cold-hot.eps"
