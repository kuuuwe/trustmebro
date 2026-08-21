# Inspect birthmonth-component of a string

Check whether a given string contains exactly one two-digit number that
represents a valid month of the year (between 01 and 12). The string is
assumed to be a code (e.g., a SGIC), which may include letters and
digits.

## Usage

``` r
inspect_birthmonth(code)
```

## Arguments

- code:

  A character string containing a SGIC or similar code that may include
  a numeric birth month-component.

## Value

A logical value: \`TRUE\` if the string contains only one valid birth
month-component (between 01 and 12), otherwise \`FALSE\`.

## Examples

``` r
inspect_birthday("DEF66") # FALSE - 66 is not a valid month
#> [1] FALSE
inspect_birthday("GHI02") # TRUE - 02 (February) is a valid month
#> [1] TRUE
inspect_birthday("ABC12DEF10") # FALSE - Multiple numeric components
#> [1] FALSE
inspect_birthday("XYZ") # FALSE - No numeric component
#> [1] FALSE
inspect_birthday("JKL11") # TRUE - 11 (November) is a valid day
#> [1] TRUE
```
