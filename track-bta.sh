#!/bin/bash 
#
# Track exported BTA version as provided by Aja Sherman
#
# Note that carriage returns have been replaced by whitespaces to avoid spreadsheet programs prematurely splitting rows.
# See https://github.com/jhpoelen/bat-taxonomic-alignment/issues/9
#
# 2023-04-26/2024-05-21
#
#

set -xe

#
# version carriage return script 
#
echo\
 tail -n+2\
 | tr '\r' ' ' "\
 | preston track

latest_version() {
  preston ls -l tsv\
  | grep hasVersion\
  | cut -f3\
  | head -1
}

SCRIPT_ID=latest_version

#
# version BTA 
# 
preston track https://zenodo.org/records/11193643/files/BTA_Version0.4_TSV

BTA_ID=latest_version

#
# transform BTA version using script
#
preston cat ${BTA_ID}\
 | preston bash -c "${SCRIPT_ID}"

BTA_TSV_ID=latest_version

preston alias "urn:example:bta.tsv" ${BTA_TSV_ID}
