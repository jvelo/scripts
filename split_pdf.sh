#!/bin/bash
# Usage ./pdfsplitr.sh inputfile.pdf outputfile.pdf pagenumber
# Example: ./pdfsplitr.sh myfile.pdf myotherfile.pdf 2
GS=$(which gs)
# Make sure Ghostscript is installed
if [[ $GS = "" ]]
then
  echo “Ghostscript is not installed”
  exit
fi
# Run the actual conversion.
$GS -sDEVICE=pdfwrite -q -dNOPAUSE -dBATCH -sOutputFile=$2 -dFirstPage=$3 -dLastPage=$3 $1
