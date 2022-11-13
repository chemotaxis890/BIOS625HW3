
<!-- README.md is generated from README.Rmd. Please edit that file -->

# BIOS625HW3

<!-- badges: start -->
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

Check out the help page for the `stroke` data set using `?stroke`. This
is an example data for you to test the functions in this package.

You’ll still need to render `README.Rmd` regularly, to keep `README.md`
up-to-date. `devtools::build_readme()` is handy for this. You could also
use GitHub Actions to re-render `README.Rmd` every time you push. An
example workflow can be found here:
<https://github.com/r-lib/actions/tree/v1/examples>.

You can also embed plots, for example:

<img src="man/figures/README-pressure-1.png" width="100%" />

In that case, don’t forget to commit and push the resulting figure
files, so they display on GitHub and CRAN.
