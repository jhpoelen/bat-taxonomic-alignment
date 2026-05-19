---
# replace uri to point to the name resource you'd like to align
# a url without scheme like https:// (e.g., ```url: foodorganisms.txt```) 
# is assumed to be a local file in working directory
datasets:
    - url: names.csv
      enabled: false
      type: text/csv
    - id: mdd
      enabled: false
      name: Mammal Diversity Database
      type: application/nomer
    - url: _data/names.tsv
      enabled: true
      type: text/tab-separated-values
    - url: https://serv.biokic.asu.edu/ecdysis/content/dwca/UCSB-IZC_DwC-A.zip
      enabled: false
      type: application/dwca
    - url: https://scan-bugs.org:443/portal/webservices/dwc/rss.xml 
      enabled: false
      type: application/rss+xml
# 
taxonomies:
#
# Edit list below to select taxonomies you'd like to work with. 
#
# To enable taxonomies to align with set:
#  enabled: true 
#
# To disable taxonomies to align with set: 
#  enabled: false
#
    - id: itis
      enabled: true
      name: Integrated Taxonomic Information System
    - id: ncbi
      enabled: true
      name: NCBI Taxonomy
    - id: discoverlife
      enabled: false
      name: Discover Life Taxonomy
    - id: batnames
      enabled: true
      name: Bat Names 
    - id: col
      enabled: true
      name: Catalogue of Life
    - id: gbif
      enabled: true
      name: GBIF Backbone Taxonomy
    - id: globi
      enabled: false
      name: GloBI Taxon Graph
    - id: indexfungorum
      enabled: false
      name: Index Fungorum
    - id: mdd
      enabled: true
      name: Mammal Diversity Database
    - id: ott
      enabled: false
      name: Open Tree of Life Taxonomy
    - id: pbdb
      enabled: false
      name: Paleobiology Database
    - id: plazi
      enabled: false
      name: Plazi Treatments
    - id: tpt
      enabled: false
      name: Terrestrial Parasite Tracker Taxonomies
    - id: wfo
      enabled: false
      name: World of Flora Online
---

[![Name Alignment by Nomer](../../actions/workflows/align.yml/badge.svg)](../../actions/workflows/align.yml)

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.7915722.svg)](https://doi.org/10.5281/zenodo.7915722) 

[![SWH](https://archive.softwareheritage.org/badge/swh:1:dir:8cff593258fdf08401dbc68d71768ac724d562a5/)](https://archive.softwareheritage.org/swh:1:dir:8cff593258fdf08401dbc68d71768ac724d562a5;origin=https://github.com/jhpoelen/bat-taxonomic-alignment;visit=swh:1:snp:18f95bd14be9e5ca7101d2bf6c0184663ef19c40;anchor=swh:1:rev:2952816c40bb4426a1eda4e38338b66df5de6940)

⚠️  work in progress ⚠️

Aligning bat names across taxonomic authorities is a labor intensive task. 

This repository relates the Bat Taxonomic Alignment by Aja Sherman, Cullen Geiselman, et al. to associated names in taxonomic resources like those provided by [Bat Names](https://batnames.org), [Mammal Diversity Database](https://mammaldiversity.org), Handbook of the Mammals of the World, Mammal Species of the World, and more. 


## Data Sources

The taxonomic authorities used to compile BTA, at time of writing 2026-05-18, are listed along with the suspected digital file that was used to populate associated fields in the BTA schema.

| authorityCode | authorityFilename(s) | authorityFilenameSignature(s) | derivedFrom |
| --- | --- | --- | --- |
| 1980\_CH1 | [ch1.xslx](sources/ch1.xlsx) | | https://doi.org/10.5281/zenodo.17260800 |
| 1982\_MSW1 | [msw1.xlsx](sources/msw1.xlsx) | | https://doi.org/10.5281/zenodo.13445249 |
| 1991\_CH3 | [ch3.xlsx](sources/ch3.xlsx) | | https://doi.org/10.5281/zenodo.18023078 |
| 1993\_MSW2 | [msw2.csv](https://github.com/jhpoelen/msw2/blob/main/msw2.csv) | | https://doi.org/10.5281/zenodo.13424577 |
| 1994\_Koopman | [koopman1994.xslx](sources/koopman1994.xlsx) | | https://doi.org/10.5281/zenodo.13422270 |
| 2005\_MSW3 | [38 Chiroptera final MSW3 database.xls](https://github.com/jhpoelen/msw3/blob/ee893d4b53d0a4d163b8e895373ebb40c9935294/data-raw/38%20Chiroptera%20final%20MSW3%20database.xls) | | https://doi.org/10.5281/zenodo.13520803 |
| 2019\_HMW | [HMW_2019_Handbook Treatments.xlsx](sources/HMW_2019_Handbook%20Treatments.xlsx) | | https://doi.org/10.5281/zenodo.20290441
| 2022\_BatNames | [batnames_2022_chiroptera2022Oct11.xlsx](sources/batnames_2022_chiroptera2022Oct11.xlsx) | | https://doi.org/10.5281/zenodo.6857865 |
| 2022\_IUCN | [IUCN_2022_assessments.xlsx](sources/IUCN_2022_assessments.xlsx) | | NA
| 2022\_MDD | [MDD_v1.9.1_6596species.csv](https://zenodo.org/records/7358650/files/MDD_v1.9.1_6596species.csv) | | https://doi.org/10.5281/zenodo.7358650 |
| 2023\_BatNames | [chiroptera2023-10-03batnames.xlsx](sources/chiroptera2023-10-03batnames.xlsx) | | https://doi.org/10.5281/zenodo.8136157 |
| 2023\_MDD | [MDD_v1.11_6649species.csv](https://zenodo.org/records/7830771/files/MDD_v1.11_6649species.csv) |  | https://doi.org/10.5281/zenodo.7830771 |
| 2025\_batnames\_1\_7 | [batnames_2025_1.7_Chiroptera2025-06-03.xlsx](sources/chiroptera2023-10-03batnames.xlsx) | | https://doi.org/10.5281/zenodo.14796586 |
| 2025\_MDD\_2\_0 | [MDD_v2.0_6759species.csv](https://zenodo.org/records/15007505/files/MDD_v2.0_6759species.csv) | | https://doi.org/10.5281/zenodo.15007505 |
| 2025\_MDD\_2\_2 | [MDD_v2.2_6815species.csv](https://zenodo.org/records/15659662/files/MDD_v2.2_6815species.csv) | | https://doi.org/10.5281/zenodo.15659662 |


