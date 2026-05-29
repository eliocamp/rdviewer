
<!-- README.md is generated from README.Rmd. Please edit that file -->

# rdviewer

<!-- badges: start -->

<!-- badges: end -->

rdviewer provides a user-friendly print method for parsed Rd files that
helps visualising their structure

## Installation

You can install the development version of rdviewer from
[GitHub](https://github.com/) with:

``` r
# install.packages("pak")
pak::pak("eliocamp/rdviewer")
```

## Example

We can get the parsed documentation by calling `utils:::.getHelpFile` on
the results of `help`. The result is a deeply nested list with text and
tags as attributes

``` r
help <- help("mean", package = "base")
rd <- utils:::.getHelpFile(help[1])
str(rd[[7]])  # Just one element
#> List of 9
#>  $ : chr "\n"
#>   ..- attr(*, "Rd_tag")= chr "RCODE"
#>   ..- attr(*, "srcref")= 'srcref' int [1:6] 8 8 8 8 8 8
#>   .. ..- attr(*, "srcfile")=Class 'srcfile' <environment: 0x5f528920a9b8> 
#>  $ : chr "mean(x, "
#>   ..- attr(*, "Rd_tag")= chr "RCODE"
#>   ..- attr(*, "srcref")= 'srcref' int [1:6] 9 1 9 8 1 8
#>   .. ..- attr(*, "srcfile")=Class 'srcfile' <environment: 0x5f528920a9b8> 
#>  $ : list()
#>   ..- attr(*, "Rd_tag")= chr "\\dots"
#>   ..- attr(*, "srcref")= 'srcref' int [1:6] 9 9 9 13 9 13
#>   .. ..- attr(*, "srcfile")=Class 'srcfile' <environment: 0x5f528920a9b8> 
#>  $ : chr ")\n"
#>   ..- attr(*, "Rd_tag")= chr "RCODE"
#>   ..- attr(*, "srcref")= 'srcref' int [1:6] 9 14 9 15 14 15
#>   .. ..- attr(*, "srcfile")=Class 'srcfile' <environment: 0x5f528920a9b8> 
#>  $ : chr "\n"
#>   ..- attr(*, "Rd_tag")= chr "RCODE"
#>   ..- attr(*, "srcref")= 'srcref' int [1:6] 10 1 10 1 1 1
#>   .. ..- attr(*, "srcfile")=Class 'srcfile' <environment: 0x5f528920a9b8> 
#>  $ :List of 2
#>   ..$ :List of 1
#>   .. ..$ : chr "mean"
#>   .. .. ..- attr(*, "Rd_tag")= chr "TEXT"
#>   .. .. ..- attr(*, "srcref")= 'srcref' int [1:6] 11 9 11 12 9 12
#>   .. .. .. ..- attr(*, "srcfile")=Class 'srcfile' <environment: 0x5f528920a9b8> 
#>   ..$ :List of 1
#>   .. ..$ : chr "default"
#>   .. .. ..- attr(*, "Rd_tag")= chr "TEXT"
#>   .. .. ..- attr(*, "srcref")= 'srcref' int [1:6] 11 15 11 21 15 21
#>   .. .. .. ..- attr(*, "srcfile")=Class 'srcfile' <environment: 0x5f528920a9b8> 
#>   ..- attr(*, "Rd_tag")= chr "\\method"
#>   ..- attr(*, "srcref")= 'srcref' int [1:6] 11 1 11 22 1 22
#>   .. ..- attr(*, "srcfile")=Class 'srcfile' <environment: 0x5f528920a9b8> 
#>  $ : chr "(x, trim = 0, na.rm = FALSE, "
#>   ..- attr(*, "Rd_tag")= chr "RCODE"
#>   ..- attr(*, "srcref")= 'srcref' int [1:6] 11 23 11 51 23 51
#>   .. ..- attr(*, "srcfile")=Class 'srcfile' <environment: 0x5f528920a9b8> 
#>  $ : list()
#>   ..- attr(*, "Rd_tag")= chr "\\dots"
#>   ..- attr(*, "srcref")= 'srcref' int [1:6] 11 52 11 56 52 56
#>   .. ..- attr(*, "srcfile")=Class 'srcfile' <environment: 0x5f528920a9b8> 
#>  $ : chr ")\n"
#>   ..- attr(*, "Rd_tag")= chr "RCODE"
#>   ..- attr(*, "srcref")= 'srcref' int [1:6] 11 57 11 58 57 58
#>   .. ..- attr(*, "srcfile")=Class 'srcfile' <environment: 0x5f528920a9b8> 
#>  - attr(*, "Rd_tag")= chr "\\usage"
#>  - attr(*, "srcref")= 'srcref' int [1:6] 8 1 12 1 1 1
#>   ..- attr(*, "srcfile")=Class 'srcfile' <environment: 0x5f528920a9b8>
```

The default print method hides all that and prints a approximate
representation of the original .Rd file

``` r
rd
#> \title{Arithmetic Mean}\name{mean}\alias{mean}\alias{mean.default}\keyword{univar}\description{
#>   Generic function for the (trimmed) arithmetic mean.
#> }\usage{
#> mean(x, \dots)
#> 
#> \method{mean}{default}(x, trim = 0, na.rm = FALSE, \dots)
#> }\arguments{
#>   \item{x}{an \R object.  Currently there are methods for
#>     numeric/logical vectors and \link[=Dates]{date},
#>     \link{date-time} and \link{time interval} objects.  Complex vectors
#>     are allowed for \code{trim = 0}, only.}
#>   \item{trim}{the fraction (0 to 0.5) of observations to be
#>     trimmed from each end of \code{x} before the mean is computed.
#>     Values of trim outside that range are taken as the nearest endpoint.
#>   }
#>   \item{na.rm}{a logical evaluating to \code{TRUE} or \code{FALSE}
#>     indicating whether \code{NA} values should be stripped before the
#>     computation proceeds.} 
#>   \item{\dots}{further arguments passed to or from other methods.}
#> }\value{
#>   If \code{trim} is zero (the default), the arithmetic mean of the
#>   values in \code{x} is computed, as a numeric or complex vector of
#>   length one.  If \code{x} is not logical (coerced to numeric), numeric
#>   (including integer) or complex, \code{NA_real_} is returned, with a warning.
#> 
#>   If \code{trim} is non-zero, a symmetrically trimmed mean is computed
#>   with a fraction of \code{trim} observations deleted from each end
#>   before the mean is computed.
#> }\references{
#>   Becker, R. A., Chambers, J. M. and Wilks, A. R. (1988)
#>   \emph{The New S Language}.
#>   Wadsworth & Brooks/Cole.
#> }\seealso{
#>   \code{\link{weighted.mean}}, \code{\link{mean.POSIXct}},
#>   \code{\link{colMeans}} for row and column means.
#> }\examples{
#> x <- c(0:10, 50)
#> xm <- mean(x)
#> c(xm, mean(x, trim = 0.10))
#> }
```

rdviewer replaces that with a tree that more closely matches the actual
representation of the object

``` r
library(rdviewer)  # Just load with library
#> Registered S3 method overwritten by 'rdviewer':
#>   method   from 
#>   print.Rd tools
```

And then print

``` r
rd
#> <x>
#>   └─[1]<\title>
#>       └─[1]<TEXT> "Arithmetic Mean"
#>   └─[2]<\name>
#>       └─[1]<VERB> "mean"
#>   └─[3]<\alias>
#>       └─[1]<VERB> "mean"
#>   └─[4]<\alias>
#>       └─[1]<VERB> "mean.default"
#>   └─[5]<\keyword>
#>       └─[1]<TEXT> "univar"
#>   └─[6]<\description>
#>       └─[1]<TEXT> "\n"
#>       └─[2]<TEXT> "  Generic function for the (trimmed) arithmetic mean.\n"
#>   └─[7]<\usage>
#>       └─[1]<RCODE> "\n"
#>       └─[2]<RCODE> "mean(x, "
#>       └─[3]<\dots>
#>       └─[4]<RCODE> ")\n"
#>       └─[5]<RCODE> "\n"
#>       └─[6]<\method>
#>           └─[1]<NULL>
#>               └─[1]<TEXT> "mean"
#>           └─[2]<NULL>
#>               └─[1]<TEXT> "default"
#>       └─[7]<RCODE> "(x, trim = 0, na.rm = FALSE, "
#>       └─[8]<\dots>
#>       └─[9]<RCODE> ")\n"
#>   └─[8]<\arguments>
#>       └─[1]<TEXT> "\n"
#>       └─[2]<TEXT> "  "
#>       └─[3]<\item>
#>           └─[1]<NULL>
#>               └─[1]<TEXT> "x"
#>           └─[2]<NULL>
#>               └─[1]<TEXT> "an "
#>               └─[2]<\R>
#>               └─[3]<TEXT> " object.  Currently there are methods for\n"
#>               └─[4]<TEXT> "    numeric/logical vectors and "
#>               └─[5]<\link>
#>                   └─[1]<TEXT> "date"
#>               └─[6]<TEXT> ",\n"
#>               └─[7]<TEXT> "    "
#>               └─[8]<\link>
#>                   └─[1]<TEXT> "date-time"
#>               └─[9]<TEXT> " and "
#>               └─[10]<\link>
#>                   └─[1]<TEXT> "time interval"
#>               └─[11]<TEXT> " objects.  Complex vectors\n"
#>               └─[12]<TEXT> "    are allowed for "
#>               └─[13]<\code>
#>                   └─[1]<RCODE> "trim = 0"
#>               └─[14]<TEXT> ", only."
#>       └─[4]<TEXT> "\n"
#>       └─[5]<TEXT> "  "
#>       └─[6]<\item>
#>           └─[1]<NULL>
#>               └─[1]<TEXT> "trim"
#>           └─[2]<NULL>
#>               └─[1]<TEXT> "the fraction (0 to 0.5) of observations to be\n"
#>               └─[2]<TEXT> "    trimmed from each end of "
#>               └─[3]<\code>
#>                   └─[1]<RCODE> "x"
#>               └─[4]<TEXT> " before the mean is computed.\n"
#>               └─[5]<TEXT> "    Values of trim outside that range are taken as the nearest endpoint.\n"
#>               └─[6]<TEXT> "  "
#>       └─[7]<TEXT> "\n"
#>       └─[8]<TEXT> "  "
#>       └─[9]<\item>
#>           └─[1]<NULL>
#>               └─[1]<TEXT> "na.rm"
#>           └─[2]<NULL>
#>               └─[1]<TEXT> "a logical evaluating to "
#>               └─[2]<\code>
#>                   └─[1]<RCODE> "TRUE"
#>               └─[3]<TEXT> " or "
#>               └─[4]<\code>
#>                   └─[1]<RCODE> "FALSE"
#>               └─[5]<TEXT> "\n"
#>               └─[6]<TEXT> "    indicating whether "
#>               └─[7]<\code>
#>                   └─[1]<RCODE> "NA"
#>               └─[8]<TEXT> " values should be stripped before the\n"
#>               └─[9]<TEXT> "    computation proceeds."
#>       └─[10]<TEXT> " \n"
#>       └─[11]<TEXT> "  "
#>       └─[12]<\item>
#>           └─[1]<NULL>
#>               └─[1]<\dots>
#>           └─[2]<NULL>
#>               └─[1]<TEXT> "further arguments passed to or from other methods."
#>       └─[13]<TEXT> "\n"
#>   └─[9]<\value>
#>       └─[1]<TEXT> "\n"
#>       └─[2]<TEXT> "  If "
#>       └─[3]<\code>
#>           └─[1]<RCODE> "trim"
#>       └─[4]<TEXT> " is zero (the default), the arithmetic mean of the\n"
#>       └─[5]<TEXT> "  values in "
#>       └─[6]<\code>
#>           └─[1]<RCODE> "x"
#>       └─[7]<TEXT> " is computed, as a numeric or complex vector of\n"
#>       └─[8]<TEXT> "  length one.  If "
#>       └─[9]<\code>
#>           └─[1]<RCODE> "x"
#>       └─[10]<TEXT> " is not logical (coerced to numeric), numeric\n"
#>       └─[11]<TEXT> "  (including integer) or complex, "
#>       └─[12]<\code>
#>           └─[1]<RCODE> "NA_real_"
#>       └─[13]<TEXT> " is returned, with a warning.\n"
#>       └─[14]<TEXT> "\n"
#>       └─[15]<TEXT> "  If "
#>       └─[16]<\code>
#>           └─[1]<RCODE> "trim"
#>       └─[17]<TEXT> " is non-zero, a symmetrically trimmed mean is computed\n"
#>       └─[18]<TEXT> "  with a fraction of "
#>       └─[19]<\code>
#>           └─[1]<RCODE> "trim"
#>       └─[20]<TEXT> " observations deleted from each end\n"
#>       └─[21]<TEXT> "  before the mean is computed.\n"
#>   └─[10]<\references>
#>       └─[1]<TEXT> "\n"
#>       └─[2]<TEXT> "  Becker, R. A., Chambers, J. M. and Wilks, A. R. (1988)\n"
#>       └─[3]<TEXT> "  "
#>       └─[4]<\emph>
#>           └─[1]<TEXT> "The New S Language"
#>       └─[5]<TEXT> ".\n"
#>       └─[6]<TEXT> "  Wadsworth & Brooks/Cole.\n"
#>   └─[11]<\seealso>
#>       └─[1]<TEXT> "\n"
#>       └─[2]<TEXT> "  "
#>       └─[3]<\code>
#>           └─[1]<\link>
#>               └─[1]<TEXT> "weighted.mean"
#>       └─[4]<TEXT> ", "
#>       └─[5]<\code>
#>           └─[1]<\link>
#>               └─[1]<TEXT> "mean.POSIXct"
#>       └─[6]<TEXT> ",\n"
#>       └─[7]<TEXT> "  "
#>       └─[8]<\code>
#>           └─[1]<\link>
#>               └─[1]<TEXT> "colMeans"
#>       └─[9]<TEXT> " for row and column means.\n"
#>   └─[12]<\examples>
#>       └─[1]<RCODE> "\n"
#>       └─[2]<RCODE> "x <- c(0:10, 50)\n"
#>       └─[3]<RCODE> "xm <- mean(x)\n"
#>       └─[4]<RCODE> "c(xm, mean(x, trim = 0.10))\n"
```
