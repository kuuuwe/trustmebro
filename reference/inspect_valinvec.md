# Inspect if a value is in a recode map

Check whether a given value is present as a key in a specified recode
map. Inputs can be validated against a set of predefined categories or
labels.

## Usage

``` r
inspect_valinvec(value, recode_map)
```

## Arguments

- value:

  A single value to inspect, which is checked against the keys of a
  recode map.

- recode_map:

  A named vector where the names represent the keys to check against.
  The values of the vector are ignored.

## Value

A logical value: \`TRUE\` if the \`value\` is a key in the
\`recode_map\`, otherwise \`FALSE\`.

## Examples

``` r
recode_map <- c(male = "M", female = "F")
inspect_valinvec("female", recode_map) # TRUE - "female" is a key in the recode map
#> [1] TRUE
inspect_valinvec("other", recode_map) # FALSE - "other" is not a key in the recode map
#> [1] FALSE
```
