#' Get random peptides from protein sequences
#'
#' @param dt A dataframe with at least 1 column containg protein sequence
#' @param mer_len An integer number, the length of random peptide
#' @param random_num An integer number, the number of random peptides needed
#'
#' @return A dataframe with a column named random_pep, containg the random peptides of sepecific length extracted from given proteins.
#' @export
#'
#' @examples
#'res <- rpep(uniprot_protein_test,mer_len=9,random_num=100)
#'
#'
rpep <-  function(dt,mer_len,random_num,pepseq_col,id_col){
  colnames(dt)[which(colnames(dt)==pepseq_col)] <- "seq"
  dt$len <- nchar(dt$seq)
  dt <- dt %>% filter(len >= mer_len)
  dt$max_num <- dt$len - mer_len + 1
  all_num <- cumsum(dt$max_num)
  ##random select peptides
  select_num <- sample(1:all_num[length(all_num)],size = random_num)
  select_pep <- findInterval(select_num,all_num) + 1
  ids_freq <- table(select_pep) %>% as.data.frame()##which protein is selected and how many random peptides need from each protein
  ids_freq$select_pep <- as.numeric(as.character(ids_freq$select_pep))
  res <- mapply(EasyBioinfo:::get_random_pep,
                id = ids_freq$select_pep,
                num = ids_freq$Freq,MoreArgs = list(dt=dt,mer_len=mer_len),SIMPLIFY = FALSE)
  names(res) <- ids_freq$select_pep
  res <- bind_rows(res,.id = "ids")
  colnames(res)[2] <- "random_pep"
  res$ids <- dt[res$ids,id_col]
  return(res)
}
