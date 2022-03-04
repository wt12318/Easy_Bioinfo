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

#' Protein accession IDs from Uniprot database
#'
#' A dataset containing the mapping between gene id (Entrez ID) and Uniprot protein accession id
#'
#' @format A data frame with 204185 rows and 2 variables:
#' \describe{
#'   \item{acc}{Uniport protein accession ID}
#'   \item{EntrezGene}{Entrez gene ID}
#' }
#' @source \url{https://ftp.uniprot.org/pub/databases/uniprot/current_release/knowledgebase/idmapping/}
#' @export
"accession_uniprot"
