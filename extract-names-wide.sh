#!/bin/bash 
#
# Extract names from tracked copy of BTA provided by Aja Sherman
#
# 2023-04-26
#

set -xe

COMPLETE_TSV_HASH=$(preston ls -l tsv | grep hasVersion | grep "urn:example:bta.tsv" | head -1 | cut -f3)

preston cat ${COMPLETE_TSV_HASH}\
 | nl\
 | tail -n+1\
 | cut -f1,4-18\
 | sed -E "s/^\s+//g"\
 | sed -E "s/^1\t/treatmentId\t/g"\
 | sed -E "s+^([0-9]*)+https://linker.bio/line:${COMPLETE_TSV_HASH}!/L1,L\1.tsv+g"\
 | sed "s+.*treatmentId+treatmentId+g"\
 | mlr --tsvlite rename -r '(.*)([0-9]+)([.])([0-9]+)(.*),\1\2_\4\5'\
 | mlr --tsvlite rename -r 'name_(.*)_([0-9]{4})(.*),\2_\1\3'

