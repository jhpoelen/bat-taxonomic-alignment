#!/bin/bash
#
#

exportTSV() {
 preston alias "urn:example:bta.tsv"\
 | preston cat
} 

exportTSV\
 > bta.tsv
 
exportTSV\
 | mlr --itsvlite --ocsv cat\
 > bta.csv
 
exportTSV\
 | mlr --itsvlite --ojsonl cat\
 > bta.json
 
