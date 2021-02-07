#' Gene expression profile of 293T cell line
#'
#' Two replications for WT and METTL3 KD 293T cell line, the counts in the dataframe are results of FeatureCounts.
#'
#' @format A data frame with 27165 rows and 4 variables:
#' \describe{
#'   \item{Ctrl_rep1}{gene expression of control WT 293T cell, replication 1}
#'   \item{Ctrl_rep2}{gene expression of control WT 293T cell, replication 2}
#'   \item{METTL3_KD_rep1}{gene expression of control WT 293T cell, replication 1}
#'   \item{METTL3_KD_rep2}{gene expression of control WT 293T cell, replication 2}
#' }

"count_df"

#' Survival data of 1000 samples in TCGA project
#'
#' @format A data frame with 1000 rows and 6 variables:
#' \describe{
#'   \item{sample}{TCGA sample barcode}
#'   \item{age}{age of samples}
#'   \item{gender}{gender of samples; Male/Female}
#'   \item{Tumor_stage}{Tumor stages}
#'   \item{OS}{OS status}
#'   \item{OS.time}{Survial time}
#' }

"sample_survival"
