# trustmebro
trustmebro is designed to make data wrangling with ID-related aspects more comfortable.
  This package provides functions that make it easy to inspect various subject-generated ID codes (SGIC) for plausibility.
  It also helps with inspecting other common identifiers, ensuring that your data stays clean and reliable.
  Beyond plausibility checks, trustmebro offers a few tools for smooth data import and convenient recoding.
  
If you’re working with messy IDs, this package got you covered. Trust me, bro!

### Context and Use
trustmebro was developed specifically for data linkage at the trusted third party
  (Vertrauensstelle: <https://ifbq.hamburg.de/datenmanagement/vertrauensstelle/>) at the 
  Authority for Schools and Vocational Education of Hamburg, Germany (Behörde für Schule und Berufsbildung Hamburg).
  We use this package ourselves exclusively for linking student data for research purposes.

### Inspecting IDs

trustmebro offers several functions for checking the plausibility of SGICs and other variables that might be used as identifiers.
  Best check out `vignette(trustmebro::Inspect_SGICs)` to learn how to perform plausibility checks on your IDs.

### Comfy Stuff

trustmebro also comes with a few functions which make our day-to-day business about messy data more comfortable.
  If you want to be comfy while loading and recoding data, take a look at `vignette(trustmebro::Get_data_matchready)`.

<!-- badges: start -->
[![R-CMD-check](https://github.com/kuuuwe/trustmebro/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/kuuuwe/trustmebro/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->
