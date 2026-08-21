# Inspect birthday-component of a string

Check whether a given string contains exactly one two-digit number that
represents a valid day of the month (between 01 and 31). The string is
assumed to be a code (e.g., a SGIC), which may include letters and
digits.

## Usage

``` r
inspect_birthday(code)
```

## Arguments

- code:

  A character string containing a SGIC or similar code that may include
  a numeric birthday-component.

## Value

A logical value: \`TRUE\` if the string contains only one valid
birthday-component (between 01 and 31), otherwise \`FALSE\`.

## Examples

``` r
inspect_birthday("DEF66") # FALSE - 66 is not a valid day
#> [1] FALSE
inspect_birthday("GHI02") # TRUE - 02 is a valid day
#> [1] TRUE
inspect_birthday("ABC12DEF34") # FALSE - Multiple numeric components
#> [1] FALSE
inspect_birthday("XYZ") # FALSE - No numeric component
#> [1] FALSE
inspect_birthday("JKL31") # TRUE - 31 is a valid day
#> [1] TRUE
```
