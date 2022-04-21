#' Do gsva
#'
#' @param exp_dt A normalized gene expression dataset, genes corresponding to rows and samples corresponding to columns.
#' @param gmt_path Pathway gmt file path
#' @param exp_type expression type, can be "array" or "RNA-seq"
#' @param ... other param for gsva
#'
#' @return gene-set-by-sample expression data matrix
#' @export
#'
#' @examples
#' res <- do_gsva(as.matrix(tpm_gene_log2),"inst/extdata/h.all.v7.4.symbols.gmt",exp_type = "array",parallel.sz=4)
do_gsva <- function(exp_dt,gmt_path,exp_type="array",...){
  if (exp_type %in% c("array","RNA-seq")){
    if (exp_type == "array"){
      kcdf = "Gaussian"
    }else{
      kcdf = "Poisson"
    }

    pathways <- fgsea::gmtPathways(gmt_path)
    path_ranges <- range(lengths(pathways))
    res <- GSVA::gsva(exp_dt, pathways,kcdf=kcdf,...)
    return(res)

  }else{
    message("please input valid expression type")
  }
}
