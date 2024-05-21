#!/bin/bash
#
#

exportTSV() {
 preston alias "urn:example:bta.tsv"\
 | preston cat\
 | tail -n+2
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
 > bta.xlsx
