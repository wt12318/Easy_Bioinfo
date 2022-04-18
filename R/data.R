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

#' Cancer type code and TCGA Study Abbreviations
#'
#' A dataset containing the relationship between Cancer type code and TCGA Study Abbreviations
#'
#' @format A data frame with 830 rows and 3 variables:
#' \describe{
#'   \item{cancer_code}{two characters, representing 6 and 7 position of TCGA sample barcode}
#'   \item{cancer_type_full_name}{full name of TCGA cancer type}
#'   \item{cancer_type}{TCGA cancer type abbreviations}
#' }
#' @source \url{https://gdc.cancer.gov/resources-tcga-users/tcga-code-tables/tissue-source-site-codes}
#' @source \url{https://gdc.cancer.gov/resources-tcga-users/tcga-code-tables/tcga-study-abbreviations}
#' @export
"cancer_type_code"

#' Protein sequence from Uniprot database (only take 50 proteins for example)
#'
#' A dataframe containing sequences of 50 proteins
#'
#' @format A data frame with 50 rows and 3 variables:
#' \describe{
#'   \item{id}{Uniport protein accession ID}
#'   \item{len}{Length of the sequence}
#'   \item{seq}{Sequence of the protein}
#' }
#' @source \url{https://www.uniprot.org/downloads}
"uniprot_protein_test"
