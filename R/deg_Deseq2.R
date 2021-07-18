#' Differential expression analysis using DESeq2
#'
#' @param dt A data frame, rows are gene expression (counts),columns are sample names; the order of columns must be
#'     control samples followed by treatment samples.
#' @param control_label A character vector, name for control samples,such as "ctrl".
#' @param control_counts A numeric vector, how many samples are control.
#' @param treatment_lable A character vector, name for treatment samples,such as "KD"(Knockdown).
#' @param treatment_counts A numeric vector, how many samples are treatment.
#' @param parallel 	if FALSE, no parallelization. if TRUE, parallel execution using BiocParallel.
#' @param ncores the number of cores for parallelization.
#'
#' @return Return a result dataframe from a DESeq analysis giving base means across samples, log2 fold changes,
#'     standard errors, test statistics, p-values and adjusted p-values
#' @export
#'
#' @examples
#' res <- deg_deseq2(count_df,control_label="ctrl",control_counts=2,treatment_lable="KD",treatment_counts=2)
deg_deseq2 <- function(dt,control_label,control_counts,treatment_lable,treatment_counts,parallel = FALSE,ncores=1){
  count_df.filter <- dt[rowSums(dt) > 10 ,]## keep only rows that have at least 10 reads total

  # condition table
  sample_df <- data.frame(
    condition = c(rep(control_label,control_counts), rep(treatment_lable,treatment_counts))
  )
  if (nrow(sample_df) != ncol(count_df.filter)){
    stop("the condition counts are not same as the sample counts, please check it!")
  }
  rownames(sample_df) <- colnames(count_df.filter)

  sample_df$condition <- factor(sample_df$condition)
  sample_df$condition <- relevel(sample_df$condition, ref = control_label)
  deseq2.obj <- DESeq2::DESeqDataSetFromMatrix(countData = count_df.filter, colData = sample_df, design = ~condition)
  BiocParallel::register(BiocParallel::MulticoreParam(ncores))
  deseq2.obj <- DESeq2::DESeq(deseq2.obj,parallel = TRUE)

  # get result
  deseq2.obj.res <- DESeq2::results(deseq2.obj,contrast = c("condition",treatment_lable,control_label))
  deseq2.obj.res.df <- as.data.frame(deseq2.obj.res)
  return(deseq2.obj.res.df)
}
