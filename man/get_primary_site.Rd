% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_primary_site.R
\name{get_primary_site}
\alias{get_primary_site}
\title{Get TCGA cancer primary site}
\usage{
get_primary_site(input)
}
\arguments{
\item{input}{TCGA tumor sample barcode, a character vector}
}
\value{
Primary site
}
\description{
Return TCGA cancer primary site for TCGA sample barcode.
}
\examples{
get_primary_site("TCGA-OR-A5J1")
}
