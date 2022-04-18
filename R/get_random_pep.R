
get_random_pep <- function(id,num,dt,mer_len){
  seq_tmp <- dt$seq[id]
  res <- sapply(seq(1:(nchar(seq_tmp)-(mer_len-1))),function(x,y){substr(y,x,x+(mer_len-1))},seq_tmp) %>%
    as.data.frame() %>%
    slice_sample(n=num)
  return(res)
}
