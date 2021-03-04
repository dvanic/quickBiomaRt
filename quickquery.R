library("biomaRt")
library("dplyr")
listMarts()



ensembl <- useMart("ENSEMBL_MART_SNP")
datasets <- listDatasets(ensembl)

dogensembl = useDataset("clfamiliaris_snp",mart=ensembl)

test <- 
  getBM(attributes=c("refsnp_id", "refsnp_source", "refsnp_source_description", "snp", "validated"), 
      filters = "chromosomal_region", 
      values = "27:38924099",
      mart = dogensembl) 

test %>%
  filter(snp == "%A/G%") 

test %>%
  filter(refsnp_id == "rs852456570")

