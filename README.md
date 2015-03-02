<!-- README.md is generated from README.Rmd. Please edit that file -->
Description
===========

`gair` contains functions that download raw air data from various websites.

-   `gairEPA()` downloads U.S. air data from EPA website and exports R data file or Stata data file.

Install
=======

To install the lastest version:

``` r
# install.packages("devtools")
devtools::install_github("jjchern/gair")
```

Examples
========

To download hourly pm25 data for year 2014 from the EPA website:

``` r
gair::gairEPA(2014, "pm25", "hourly")
```
