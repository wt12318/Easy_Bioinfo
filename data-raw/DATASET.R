## code to prepare `DATASET` dataset goes here
##read data
count_df <- read.table("data-raw/293T-RNASeq-Ctrl_vs_KD.STAR.hg38.featureCounts.tsv")
usethis::use_data(count_df, overwrite = TRUE)
###TCGA log2 TPM data
library(dplyr)
tpm_gene_log2 <- readRDS("~/useful_data/xena_RSEM_TPM/tpm_gene_log2.rds")
tpm_gene_log2 <- tpm_gene_log2[,1:20] %>%
  select(-id)
which(duplicated(tpm_gene_log2$gene))

tpm_gene_log2 <- tpm_gene_log2[!duplicated(tpm_gene_log2$gene),]
rownames(tpm_gene_log2) <- tpm_gene_log2$gene
tpm_gene_log2 <- tpm_gene_log2 %>% select(-gene)
usethis::use_data(tpm_gene_log2, overwrite = TRUE)

