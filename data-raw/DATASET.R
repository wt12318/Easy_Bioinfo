## code to prepare `DATASET` dataset goes here
##read data
count_df <- read.table("data-raw/293T-RNASeq-Ctrl_vs_KD.STAR.hg38.featureCounts.tsv")

usethis::use_data(count_df, overwrite = TRUE)
