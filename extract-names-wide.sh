#!/bin/bash 
#
# Extract names from tracked copy of BTA provided by Aja Sherman
#
# 2023-04-26
#

set -xe

COMPLETE_TSV_HASH=$(preston ls -l tsv | grep hasVersion | grep "urn:example:bta.tsv" | cut -f3)

NAME_COLUMN_PATTERN='^Name[_\s][0-9a-zA-Z]+'

preston cat ${COMPLETE_TSV_HASH}\
 | sed -E 's/^name_MSW3\tname_HMW\tname_BatNames\tname_MDD\tname_IUCN\tname_BatNames_2023\tname_MDD_2023/Name_MSW3\tName_HMW\tName_BatNames\tName_MDD\tName_IUCN\tName_BatNames_2023\tName_MDD_2023/g'\
 | nl\
 | tail -n+2\
 | sed -E "s/^\s+//g"\
 | sed -E "s/^2\t/treatmentId\t/g"\
 | sed -E "s+^([0-9]*)+https://linker.bio/line:${COMPLETE_TSV_HASH}!/L2,L\1.tsv+g"\
 | sed "s+.*treatmentId+treatmentId+g"\
 | mlr --tsvlite cut -r -f $NAME_COLUMN_PATTERN,treatmentId\
 | mlr --tsvlite sort -f treatmentId
