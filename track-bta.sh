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

echo\
 "curl https://zenodo.org/records/11193643/files/BTA_Version0.4_TSV\
 | tail -n+2\
 | tr '\r' ' ' "\
 | preston bash 
