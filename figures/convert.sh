#!/bin/bash
convert -density 600 $1.eps -density 300 -resize 800 $1.png
