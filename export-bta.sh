#!/bin/bash
#
#

exportTSV() {
 preston alias "urn:example:bta.tsv"\
 | head -n1\
 | preston cat\
 | tail -n+2\
 | cut -f1-15\
 | mlr --tsvlite rename -r '(.*)([0-9]+)([.])([0-9]+)(.*),\1\2_\4\5'
} 

exportTSV\
 > bta.tsv
 
exportTSV\
 | mlr --itsvlite --ocsv cat\
 > bta.csv
 
exportTSV\
 | mlr --itsvlite --ojsonl cat\
 > bta.json

preston alias "urn:example:bta.xlsx"\
 | head -n1\
 | preston cat\
 > bta.xlsx
