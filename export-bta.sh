#!/bin/bash
#
#

exportTSV() {
 preston alias "urn:example:bta.tsv"\
 | head -n1\
 | preston cat\
 | tail -n+2\
 | sed -E 's/^name_MSW3\tname_HMW\tname_BatNames\tname_MDD\tname_IUCN\tname_BatNames_2023\tname_MDD_2023/Name_MSW3\tName_HMW\tName_BatNames\tName_MDD\tName_IUCN\tName_BatNames_2023\tName_MDD_2023/g'
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
