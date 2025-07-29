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
echo "tr '\r' ' '"\
 | preston track

latest_version() {
  preston ls -l tsv\
  | grep hasVersion\
  | cut -f3\
  | head -1
}

SCRIPT_ID=$(latest_version)

#
# version BTA 
# 
preston track "https://zenodo.org/records/16423149/files/BTA_v5%20(5).xlsx"
preston alias "urn:example:bta.xlsx" "$(latest_version)"

preston track "https://zenodo.org/records/16423149/files/BTA_v5%20-%20Sheet1.tsv"

BTA_ID=$(latest_version)

#
# transform BTA version using script
#
preston cat "$(latest_version)"\
 | preston bash -c "${SCRIPT_ID}"

BTA_TSV_ID=$(latest_version)

preston alias "urn:example:bta.tsv" ${BTA_TSV_ID}
