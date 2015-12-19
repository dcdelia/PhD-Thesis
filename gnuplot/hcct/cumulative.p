reset
load "palettes/palette-lines.p"
do for [i=1:8] {
    set style line i lw 2.33 ps 1
}
set terminal x11
set title "Cumulative frequencies"
set key right bottom inside
set ylabel "% of the total number of calls\n (degree of overlap with full CCT)"
set xlabel "% of hottest calling contexts"
set xrange [-1:100]
set xtics 10
#set yrange [0:100]
set yrange [50:100]
set size ratio -1
set grid

plot    'data/max-phi/cct-max-phi-amarok.log' using 6:2  with linespoints title '   amarok'  ,\
        'data/max-phi/cct-max-phi-audacity.log' using 6:2  with linespoints title '   audacity'  ,\
        'data/max-phi/cct-max-phi-firefox.log' using 6:2  with linespoints title 'firefox'  ,\
        'data/max-phi/cct-max-phi-gedit.log' using 6:2  with linespoints title 'gedit'  ,\
        'data/max-phi/cct-max-phi-oocalc.log' using 6:2  with linespoints title 'oocalc'  ,\
        'data/max-phi/cct-max-phi-pidgin.log' using 6:2  with linespoints title 'pidgin'  ,\
        'data/max-phi/cct-max-phi-quanta.log' using 6:2  with linespoints title 'quanta'  ,\
        'data/max-phi/cct-max-phi-vlc.log' using 6:2  with linespoints title 'vlc'

set terminal postscript eps enhanced color dashed "Helvetica" 15
set output 'out/skewness-noBB.eps'
replot
#system "ps2eps -B tmp/cumulative-noBB.eps; mv tmp/cumulative-noBB.eps.eps ../cumulative.eps"


#plot    '../logs/max-phi/cct-max-phi-amarok.log' using 6:2  with linespoints title '   amarok'  ,\
#        '../logs/max-phi/cct-max-phi-ark.log' using 6:2  with linespoints title 'ark'  ,\
#        '../logs/max-phi/cct-max-phi-audacity.log' using 6:2  with linespoints title '   audacity'  ,\
#        '../logs/max-phi/cct-max-phi-bluefish.log' using 6:2  with linespoints title 'bluefish'  ,\
#        '../logs/max-phi/cct-max-phi-dolphin.log' using 6:2  with linespoints title 'dolphin'  ,\
#        '../logs/max-phi/cct-max-phi-firefox.log' using 6:2  with linespoints title 'firefox'  ,\
#        '../logs/max-phi/cct-max-phi-gedit.log' using 6:2  with linespoints title 'gedit'  ,\
#        '../logs/max-phi/cct-max-phi-ghex2.log' using 6:2  with linespoints title 'ghex2'  ,\
#        '../logs/max-phi/cct-max-phi-gimp.log' using 6:2  with linespoints title 'gimp'  ,\
#        '../logs/max-phi/cct-max-phi-gwenview.log' using 6:2  with linespoints title 'gwenview'  ,\
#        '../logs/max-phi/cct-max-phi-inkscape.log' using 6:2  with linespoints title 'inkscape'  ,\
#        '../logs/max-phi/cct-max-phi-oocalc.log' using 6:2  with linespoints title 'oocalc'  ,\
#        '../logs/max-phi/cct-max-phi-ooimpress.log' using 6:2  with linespoints title 'ooimpress'  ,\
#        '../logs/max-phi/cct-max-phi-oowriter.log' using 6:2  with linespoints title 'oowriter'  ,\
#        '../logs/max-phi/cct-max-phi-pidgin.log' using 6:2  with linespoints title 'pidgin'  ,\
#        '../logs/max-phi/cct-max-phi-quanta.log' using 6:2  with linespoints title 'quanta'  ,\
#        '../logs/max-phi/cct-max-phi-sudoku.log' using 6:2  with linespoints title 'sudoku'  ,\
#        '../logs/max-phi/cct-max-phi-vlc.log' using 6:2  with linespoints title 'vlc'
