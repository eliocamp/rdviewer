
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
#>   .. ..- attr(*, "srcfile")=Class 'srcfile' <environment: 0x55a682e54fa8> 
#>  $ : chr "mean(x, "
#>   ..- attr(*, "Rd_tag")= chr "RCODE"
#>   ..- attr(*, "srcref")= 'srcref' int [1:6] 9 1 9 8 1 8
#>   .. ..- attr(*, "srcfile")=Class 'srcfile' <environment: 0x55a682e54fa8> 
#>  $ : list()
#>   ..- attr(*, "Rd_tag")= chr "\\dots"
#>   ..- attr(*, "srcref")= 'srcref' int [1:6] 9 9 9 13 9 13
#>   .. ..- attr(*, "srcfile")=Class 'srcfile' <environment: 0x55a682e54fa8> 
#>  $ : chr ")\n"
#>   ..- attr(*, "Rd_tag")= chr "RCODE"
#>   ..- attr(*, "srcref")= 'srcref' int [1:6] 9 14 9 15 14 15
#>   .. ..- attr(*, "srcfile")=Class 'srcfile' <environment: 0x55a682e54fa8> 
#>  $ : chr "\n"
#>   ..- attr(*, "Rd_tag")= chr "RCODE"
#>   ..- attr(*, "srcref")= 'srcref' int [1:6] 10 1 10 1 1 1
#>   .. ..- attr(*, "srcfile")=Class 'srcfile' <environment: 0x55a682e54fa8> 
#>  $ :List of 2
#>   ..$ :List of 1
#>   .. ..$ : chr "mean"
#>   .. .. ..- attr(*, "Rd_tag")= chr "TEXT"
#>   .. .. ..- attr(*, "srcref")= 'srcref' int [1:6] 11 9 11 12 9 12
#>   .. .. .. ..- attr(*, "srcfile")=Class 'srcfile' <environment: 0x55a682e54fa8> 
#>   ..$ :List of 1
#>   .. ..$ : chr "default"
#>   .. .. ..- attr(*, "Rd_tag")= chr "TEXT"
#>   .. .. ..- attr(*, "srcref")= 'srcref' int [1:6] 11 15 11 21 15 21
#>   .. .. .. ..- attr(*, "srcfile")=Class 'srcfile' <environment: 0x55a682e54fa8> 
#>   ..- attr(*, "Rd_tag")= chr "\\method"
#>   ..- attr(*, "srcref")= 'srcref' int [1:6] 11 1 11 22 1 22
#>   .. ..- attr(*, "srcfile")=Class 'srcfile' <environment: 0x55a682e54fa8> 
#>  $ : chr "(x, trim = 0, na.rm = FALSE, "
#>   ..- attr(*, "Rd_tag")= chr "RCODE"
#>   ..- attr(*, "srcref")= 'srcref' int [1:6] 11 23 11 51 23 51
#>   .. ..- attr(*, "srcfile")=Class 'srcfile' <environment: 0x55a682e54fa8> 
#>  $ : list()
#>   ..- attr(*, "Rd_tag")= chr "\\dots"
#>   ..- attr(*, "srcref")= 'srcref' int [1:6] 11 52 11 56 52 56
#>   .. ..- attr(*, "srcfile")=Class 'srcfile' <environment: 0x55a682e54fa8> 
#>  $ : chr ")\n"
#>   ..- attr(*, "Rd_tag")= chr "RCODE"
#>   ..- attr(*, "srcref")= 'srcref' int [1:6] 11 57 11 58 57 58
#>   .. ..- attr(*, "srcfile")=Class 'srcfile' <environment: 0x55a682e54fa8> 
#>  - attr(*, "Rd_tag")= chr "\\usage"
#>  - attr(*, "srcref")= 'srcref' int [1:6] 8 1 12 1 1 1
#>   ..- attr(*, "srcfile")=Class 'srcfile' <environment: 0x55a682e54fa8>
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
#>   \u2514\u2500[1]<\title>
#>       \u2514\u2500[1]<TEXT> "Arithmetic Mean"
#>   \u2514\u2500[2]<\name>
#>       \u2514\u2500[1]<VERB> "mean"
#>   \u2514\u2500[3]<\alias>
#>       \u2514\u2500[1]<VERB> "mean"
#>   \u2514\u2500[4]<\alias>
#>       \u2514\u2500[1]<VERB> "mean.default"
#>   \u2514\u2500[5]<\keyword>
#>       \u2514\u2500[1]<TEXT> "univar"
#>   \u2514\u2500[6]<\description>
#>       \u2514\u2500[1]<TEXT> "\n"
#>       \u2514\u2500[2]<TEXT> "  Generic function for the (trimmed) arithmetic mean.\n"
#>   \u2514\u2500[7]<\usage>
#>       \u2514\u2500[1]<RCODE> "\n"
#>       \u2514\u2500[2]<RCODE> "mean(x, "
#>       \u2514\u2500[3]<\dots>
#>       \u2514\u2500[4]<RCODE> ")\n"
#>       \u2514\u2500[5]<RCODE> "\n"
#>       \u2514\u2500[6]<\method>
#>           \u2514\u2500[1]<NULL>
#>               \u2514\u2500[1]<TEXT> "mean"
#>           \u2514\u2500[2]<NULL>
#>               \u2514\u2500[1]<TEXT> "default"
#>       \u2514\u2500[7]<RCODE> "(x, trim = 0, na.rm = FALSE, "
#>       \u2514\u2500[8]<\dots>
#>       \u2514\u2500[9]<RCODE> ")\n"
#>   \u2514\u2500[8]<\arguments>
#>       \u2514\u2500[1]<TEXT> "\n"
#>       \u2514\u2500[2]<TEXT> "  "
#>       \u2514\u2500[3]<\item>
#>           \u2514\u2500[1]<NULL>
#>               \u2514\u2500[1]<TEXT> "x"
#>           \u2514\u2500[2]<NULL>
#>               \u2514\u2500[1]<TEXT> "an "
#>               \u2514\u2500[2]<\R>
#>               \u2514\u2500[3]<TEXT> " object.  Currently there are methods for\n"
#>               \u2514\u2500[4]<TEXT> "    numeric/logical vectors and "
#>               \u2514\u2500[5]<\link>
#>                   \u2514\u2500[1]<TEXT> "date"
#>               \u2514\u2500[6]<TEXT> ",\n"
#>               \u2514\u2500[7]<TEXT> "    "
#>               \u2514\u2500[8]<\link>
#>                   \u2514\u2500[1]<TEXT> "date-time"
#>               \u2514\u2500[9]<TEXT> " and "
#>               \u2514\u2500[10]<\link>
#>                   \u2514\u2500[1]<TEXT> "time interval"
#>               \u2514\u2500[11]<TEXT> " objects.  Complex vectors\n"
#>               \u2514\u2500[12]<TEXT> "    are allowed for "
#>               \u2514\u2500[13]<\code>
#>                   \u2514\u2500[1]<RCODE> "trim = 0"
#>               \u2514\u2500[14]<TEXT> ", only."
#>       \u2514\u2500[4]<TEXT> "\n"
#>       \u2514\u2500[5]<TEXT> "  "
#>       \u2514\u2500[6]<\item>
#>           \u2514\u2500[1]<NULL>
#>               \u2514\u2500[1]<TEXT> "trim"
#>           \u2514\u2500[2]<NULL>
#>               \u2514\u2500[1]<TEXT> "the fraction (0 to 0.5) of observations to be\n"
#>               \u2514\u2500[2]<TEXT> "    trimmed from each end of "
#>               \u2514\u2500[3]<\code>
#>                   \u2514\u2500[1]<RCODE> "x"
#>               \u2514\u2500[4]<TEXT> " before the mean is computed.\n"
#>               \u2514\u2500[5]<TEXT> "    Values of trim outside that range are taken as the nearest endpoint.\n"
#>               \u2514\u2500[6]<TEXT> "  "
#>       \u2514\u2500[7]<TEXT> "\n"
#>       \u2514\u2500[8]<TEXT> "  "
#>       \u2514\u2500[9]<\item>
#>           \u2514\u2500[1]<NULL>
#>               \u2514\u2500[1]<TEXT> "na.rm"
#>           \u2514\u2500[2]<NULL>
#>               \u2514\u2500[1]<TEXT> "a logical evaluating to "
#>               \u2514\u2500[2]<\code>
#>                   \u2514\u2500[1]<RCODE> "TRUE"
#>               \u2514\u2500[3]<TEXT> " or "
#>               \u2514\u2500[4]<\code>
#>                   \u2514\u2500[1]<RCODE> "FALSE"
#>               \u2514\u2500[5]<TEXT> "\n"
#>               \u2514\u2500[6]<TEXT> "    indicating whether "
#>               \u2514\u2500[7]<\code>
#>                   \u2514\u2500[1]<RCODE> "NA"
#>               \u2514\u2500[8]<TEXT> " values should be stripped before the\n"
#>               \u2514\u2500[9]<TEXT> "    computation proceeds."
#>       \u2514\u2500[10]<TEXT> " \n"
#>       \u2514\u2500[11]<TEXT> "  "
#>       \u2514\u2500[12]<\item>
#>           \u2514\u2500[1]<NULL>
#>               \u2514\u2500[1]<\dots>
#>           \u2514\u2500[2]<NULL>
#>               \u2514\u2500[1]<TEXT> "further arguments passed to or from other methods."
#>       \u2514\u2500[13]<TEXT> "\n"
#>   \u2514\u2500[9]<\value>
#>       \u2514\u2500[1]<TEXT> "\n"
#>       \u2514\u2500[2]<TEXT> "  If "
#>       \u2514\u2500[3]<\code>
#>           \u2514\u2500[1]<RCODE> "trim"
#>       \u2514\u2500[4]<TEXT> " is zero (the default), the arithmetic mean of the\n"
#>       \u2514\u2500[5]<TEXT> "  values in "
#>       \u2514\u2500[6]<\code>
#>           \u2514\u2500[1]<RCODE> "x"
#>       \u2514\u2500[7]<TEXT> " is computed, as a numeric or complex vector of\n"
#>       \u2514\u2500[8]<TEXT> "  length one.  If "
#>       \u2514\u2500[9]<\code>
#>           \u2514\u2500[1]<RCODE> "x"
#>       \u2514\u2500[10]<TEXT> " is not logical (coerced to numeric), numeric\n"
#>       \u2514\u2500[11]<TEXT> "  (including integer) or complex, "
#>       \u2514\u2500[12]<\code>
#>           \u2514\u2500[1]<RCODE> "NA_real_"
#>       \u2514\u2500[13]<TEXT> " is returned, with a warning.\n"
#>       \u2514\u2500[14]<TEXT> "\n"
#>       \u2514\u2500[15]<TEXT> "  If "
#>       \u2514\u2500[16]<\code>
#>           \u2514\u2500[1]<RCODE> "trim"
#>       \u2514\u2500[17]<TEXT> " is non-zero, a symmetrically trimmed mean is computed\n"
#>       \u2514\u2500[18]<TEXT> "  with a fraction of "
#>       \u2514\u2500[19]<\code>
#>           \u2514\u2500[1]<RCODE> "trim"
#>       \u2514\u2500[20]<TEXT> " observations deleted from each end\n"
#>       \u2514\u2500[21]<TEXT> "  before the mean is computed.\n"
#>   \u2514\u2500[10]<\references>
#>       \u2514\u2500[1]<TEXT> "\n"
#>       \u2514\u2500[2]<TEXT> "  Becker, R. A., Chambers, J. M. and Wilks, A. R. (1988)\n"
#>       \u2514\u2500[3]<TEXT> "  "
#>       \u2514\u2500[4]<\emph>
#>           \u2514\u2500[1]<TEXT> "The New S Language"
#>       \u2514\u2500[5]<TEXT> ".\n"
#>       \u2514\u2500[6]<TEXT> "  Wadsworth & Brooks/Cole.\n"
#>   \u2514\u2500[11]<\seealso>
#>       \u2514\u2500[1]<TEXT> "\n"
#>       \u2514\u2500[2]<TEXT> "  "
#>       \u2514\u2500[3]<\code>
#>           \u2514\u2500[1]<\link>
#>               \u2514\u2500[1]<TEXT> "weighted.mean"
#>       \u2514\u2500[4]<TEXT> ", "
#>       \u2514\u2500[5]<\code>
#>           \u2514\u2500[1]<\link>
#>               \u2514\u2500[1]<TEXT> "mean.POSIXct"
#>       \u2514\u2500[6]<TEXT> ",\n"
#>       \u2514\u2500[7]<TEXT> "  "
#>       \u2514\u2500[8]<\code>
#>           \u2514\u2500[1]<\link>
#>               \u2514\u2500[1]<TEXT> "colMeans"
#>       \u2514\u2500[9]<TEXT> " for row and column means.\n"
#>   \u2514\u2500[12]<\examples>
#>       \u2514\u2500[1]<RCODE> "\n"
#>       \u2514\u2500[2]<RCODE> "x <- c(0:10, 50)\n"
#>       \u2514\u2500[3]<RCODE> "xm <- mean(x)\n"
#>       \u2514\u2500[4]<RCODE> "c(xm, mean(x, trim = 0.10))\n"
```
