#' Wrapper function of plot KM curve by survial and survminer packages
#'
#' @param data A dataframe, containing survial status (as "OS" 0=alive, 1=dead) and survial time (as "OS.time")
#' @param var A character vector or column name (not need been quoted), varible to separate samples
#' @param ... other arguments passed to survminer::ggsurvplot
#'
#' @return ggsurvplot object
#' @export
#'
#' @examples
#' show_km(sample_survival,"gender")
#' ## or
#' show_km(sample_survival,gender)
show_km <- function(data,var,...){
  e <- substitute(var)
  f <- eval(as.formula(paste('survival::Surv(OS.time, OS)~', e)),data,parent.frame())
  fit0 <- survminer::surv_fit(f,data = data)
  p <- survminer::ggsurvplot(fit0,
                             pval = T,risk.table = T,data = data,
                             ...
  )
  return(p)
  print(p)
}
