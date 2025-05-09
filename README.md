
<!-- README.md is generated from README.Rmd. Please edit that file -->

# trustmebro <a href="https://github.com/kuuuwe/trustmebro"><img src="man/figures/logo.png" align="right" height="138"/></a>

<!-- badges: start -->

[![R-CMD-check](https://github.com/kuuuwe/trustmebro/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/kuuuwe/trustmebro/actions/workflows/R-CMD-check.yaml)

<!-- badges: end -->

## Overview

trustmebro is designed to make data wrangling with ID-related aspects
more comfortable. This package provides functions that make it easy to
inspect various subject-generated ID codes (SGIC) for plausibility. It
also helps with inspecting other common identifiers, ensuring that your
data stays clean and reliable. Beyond plausibility checks, trustmebro
offers a few tools for smooth data import and convenient recoding.

If you’re working with messy IDs, this package got you covered. Trust
me, bro!

### Context and Use

trustmebro was developed specifically for data linkage at the trusted
third party (Vertrauensstelle:
<https://ifbq.hamburg.de/datenmanagement/vertrauensstelle/>) at the
Authority for Schools and Vocational Education of Hamburg, Germany
(Behörde für Schule und Berufsbildung Hamburg). We use this package
ourselves exclusively for linking student data for research purposes.

### Inspecting IDs

trustmebro offers several functions for checking the plausibility of
SGICs and other variables that might be used as identifiers. Best check
out `vignette(trustmebro::inspect_sgics)` to learn how to perform
plausibility checks on your IDs.

### Comfy Stuff

trustmebro also comes with a few functions which make our day-to-day
business about messy data more comfortable. If you want to be comfy
while loading and recoding data, take a look at
`vignette(trustmebro::get_data_matchready)`.

### Installation

``` r
# You can install trustmebro from CRAN:
install.packages("trustmebro")
```

This will download and install the package and its dependencies. Keep an
eye out for our CRAN release, which will simplify installation in the
future.

### Getting Help

If you run into a bug, the best way to get help is to create a new issue
on the package’s [GitHub
page](https://github.com/kuuuwe/trustmebro "https://github.com/kuuuwe/trustmebro"),
describing the problem and including the code you were using. If you’re
not comfortable with GitHub, you can also contact the developers, making
sure to explain what happened and what you were trying to do.
