reset
load "palettes/palette-histograms.p" # 8 colors: red, blue, green, purple, orange, yellow, brown, pink (print-friendly)
set terminal x11
set size ratio 0.33
set title "Space comparison with full CCT\n" offset 0,1
set key maxrows 1 samplen 3 font ",11" at 20,400
set auto x
set ylabel "Virtual memory peak\n(% of full CCT)"
set logscale y
set style data histogram
set ytics 0.1,10
set yrange [0.1:150]
set xtic rotate by -45 scale 0
set style histogram cluster gap 2
set style fill solid noborder
set grid y
set grid noxtics

plot \
    'data/space.csv' using (100*$3/$2) title 'static bursting' ls 7,\
    'data/space.csv' using (100*$4/$2):xticlabels(1) title 'Space Saving' ls 2,\
    'data/space.csv' using (100*$5/$2) title 'SS + static bursting' ls 8

set terminal postscript eps color enhanced dashed "Helvetica" 12
set output 'out/space-noBB.eps'
replot
#system "ps2eps -B tmp/space-noBB.eps; mv tmp/space-noBB.eps.eps ../space.eps"
