
<!-- README.md is generated from README.Rmd. Please edit that file -->

# BIOS625HW3

<!-- badges: start -->

[![Codecov test
coverage](https://codecov.io/gh/chemotaxis890/BIOS625HW3/branch/main/graph/badge.svg)](https://app.codecov.io/gh/chemotaxis890/BIOS625HW3?branch=main)
[![R-CMD-check](https://github.com/chemotaxis890/BIOS625HW3/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/chemotaxis890/BIOS625HW3/actions/workflows/R-CMD-check.yaml)
[![R-CMD-check](https://github.com/chemotaxis890/BIOS625HW3/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/chemotaxis890/BIOS625HW3/actions/workflows/R-CMD-check.yaml)

<!-- badges: end -->

The goal of BIOS625HW3 is to develop an R package implementing an
existing R function, or a group of R functions that are closely related
to each other.

## Installation

You can install the development version of BIOS625HW3 from
[GitHub](https://github.com/) with:

``` r
# install.packages("BIOS625HW3")
devtools::install_github("chemotaxis890/BIOS625HW3")
```

## In-package Dataset

``` r
library(BIOS625HW3)
names(stroke)
#>  [1] "Age"           "Sex"           "R_E"           "Education"    
#>  [5] "Htn"           "HiChol"        "Afib"          "Cad"          
#>  [9] "Db"            "CurrentSmoker" "HxStroke"      "NIHScore"     
#> [13] "Comorbidity1"  "Fatalism"      "Depression"
```

Check out the help page for the `stroke` data set using `?stroke`,which
has a simple code book for each variable. This is a build-in data for
you to test the functions in this package.

## Function in this package

Check out the help page for the `slr()` function using `?slr()`. It is a
function that returns the result of a simple linear regression model of
two numeric variables.

For example, to get the regression model of Fatalism on Depression using
`slr()`:

``` r
slr('Depression','Fatalism',stroke)
#> $formula
#> [1] "Depression~Fatalism"
#> 
#> $coefficient
#>              Estimate   t.stat      p.value significance
#> (intercept) 1.2819113 1.781424 7.534065e-02             
#> Fatalism    0.2457615 6.227285 8.838653e-10          ***
#> 
#> $R_squared
#> [1] 0.0597724
#> 
#> $F_statistic
#> [1] 38.77908
#> 
#> $F_df1
#> [1] 1
#> 
#> $F_df2
#> [1] 610
#> 
#> $F_p_value
#> [1] 8.838653e-10
```
