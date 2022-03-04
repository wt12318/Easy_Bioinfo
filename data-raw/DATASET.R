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

###get primary site of TCGA samples
install.packages("RJSONIO")
library(RJSONIO)
library(rio)
library(dplyr)
primary_site <- import("data-raw/primary_site.json")
primary_site <- primary_site %>%
  dplyr::select(primary_site,submitter_id)
usethis::use_data(primary_site, overwrite = TRUE)

##cancer type
code <- read.csv("data-raw/TCGA_code.csv",stringsAsFactors = FALSE) %>%
  mutate(TSS.Code=ifelse(is.na(TSS.Code),"NA",TSS.Code))
study <- read.csv("data-raw/study.csv")
code <- left_join(code,
                  study,
                  by="Study.Name")
cancer_type_code <- code
cancer_type_code <- cancer_type_code %>%
  rename(cancer_code=TSS.Code,cancer_type=Study.Abbreviation,
         cancer_type_full_name=Study.Name) %>%
  select(-Source.Site,-BCR)
cancer_type_code[,1:3] <- apply(cancer_type_code[,1:3],2,as.character)
usethis::use_data(cancer_type_code,internal = TRUE,overwrite = TRUE)

##get accession id from uniprot
#ID mapping files was downloaded from https://ftp.uniprot.org/pub/databases/uniprot/current_release/knowledgebase/idmapping/by_organism/
dt <- data.table::fread("HUMAN_9606_idmapping_selected.tab",data.table = F)
dt <- dt %>% select(V1,V3)
colnames(dt) <- c("acc","EntrezGene")
saveRDS(dt,file = "accession_uniprot.rds")
usethis::use_data(accession_uniprot,overwrite = TRUE)
