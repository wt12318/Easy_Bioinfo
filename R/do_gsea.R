#' Do gsea
#'
#' @param gene_set pathway information, the path of gmt file
#' @param dt dataframe contain gene id (gene_id) and rank statistics (stat)
#' @param gene_id colname of gene_id
#' @param stat colname of stat
#'
#' @return ES
#' @export
#'
#' @examples
#' res <- deg_deseq2(count_df,control_label="ctrl",control_counts=2,treatment_lable="KD",treatment_counts=2,parallel = TRUE,ncores = 4)
#' res$gene <- rownames(res)
#' gmt.file <- system.file("extdata", "h.all.v7.4.symbols.gmt", package="EasyBioinfo")
#' gsea_res <- do_gsea(res,gene_set = gmt.file,gene_id = "gene",stat = "stat")
do_gsea <- function(dt,gene_set,gene_id,stat){
  pathways <- fgsea::gmtPathways(gene_set)
  ranks <- setNames(dt[,stat], dt[,gene_id])
  fgseaRes <- fgsea::fgsea(pathways = pathways,
                    stats    = ranks,
                    eps      = 0.0,
                    minSize  = 15,
                    maxSize  = 500)
  return(fgseaRes)
}
