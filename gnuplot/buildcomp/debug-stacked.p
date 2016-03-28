reset
load "palette.p"
set terminal x11
#set key on top center outside maxrows 1
set key on at 7.7,115 maxrows 1 samplen 3 font ",16"
set title "Global average recoverability ratio" offset 0,2 font ",20"
set ylabel "Source-level locations (%)"
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
    'data/debug-stacked.csv' using (100*$2):xtic(1) t 'live_{(e)}' fs ls 4,\
     '' using (100*$3) t 'avail' fs ls 6

set terminal postscript eps color enhanced dashed "Helvetica" 16
set output 'out/debug-stacked.eps'
replot
#system "ps2eps -B tmp/false-cold-hot-noBB.eps; mv tmp/false-cold-hot-noBB.eps.eps ../false-cold-hot.eps"
