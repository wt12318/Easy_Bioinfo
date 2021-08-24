#' get cancer type code
#'
#' @param x
#'
#' @return code
#' @export
#'
#' @examples
#' getcode("01")
getcode <- function(x,dt="cancer_type_code",
                    column_need="cancer_type",
                    column_select="cancer_code"){
  if(nchar(x)==0){
    return(NA)
  }else{
    dt <- get(dt)
    return(dt[,column_need][grep(x,dt[,column_select])])
  }
}

