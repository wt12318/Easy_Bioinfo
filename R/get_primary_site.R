#' Get TCGA cancer primary site
#'
#' Return TCGA cancer primary site for TCGA sample barcode.
#'
#' @param input TCGA tumor sample barcode, a character vector
#' @return Primary site
#' @export
#' @examples
#' get_primary_site("TCGA-OR-A5J1")

get_primary_site <- function(input){
  primary_site_dt <- EasyBioinfo::primary_site
  samples <- substr(input,1,12)
  return(sapply(samples,getcode,dt="primary_site_dt",
                column_need="primary_site",column_select="submitter_id"))
}
