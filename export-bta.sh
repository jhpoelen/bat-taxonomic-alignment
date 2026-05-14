#!/bin/bash
#
#  export latest BTA to tsv, csv and jsonlines 
#

set -x

latestBTA() {
  preston alias \
   | grep "bta.xlsx"\
   | head -n1
}

latestBTA \
 | preston cat \
 > bta.xlsx

latestJSON() {
  latestBTA \
    | preston xlsx-stream --skip-lines 1 \
    | sed 's/\\n/ /g'
}

latestJSON \
  > bta.json

latestJSON \
  | mlr --ijsonl --otsvlite cat \
  > bta.tsv

latestJSON \
  | mlr --ijsonl --ocsv cat \
  > bta.csv
