# Inspect birthday- and birthmonth-component of a string

Checks whether a given string contains exactly one four-digit number
representing a valid combination of a day (birthday) and a month (birth
month). Numeric components can be interpreted in either "DDMM"
(day-month) or "MMDD" (month-day) format, depending on the specified
format. The string is assumed to be a code (e.g., a SGIC), which may
include letters and digits.

## Usage

``` r
inspect_birthdaymonth(code, format = "DDMM")
```

## Arguments

- code:

  A character string containing a SGIC or similar code that may include
  a numeric component representing a birthday and birth month.

- format:

  A string specifying the format of the date of birth components in
  code. Use "DDMM" for day-month format and "MMDD" for month-day format.
  Default is "DDMM".

## Value

A logical value: \`TRUE\` if the string contains exactly one valid
numeric component that forms a valid birthday (day and month), otherwise
\`FALSE\`.

## Examples

``` r
inspect_birthdaymonth("DEF2802") # TRUE - 28th of February is a valid date
#> [1] TRUE
inspect_birthdaymonth("GHI3002") # FALSE - 30th of February is invalid
#> [1] FALSE
inspect_birthdaymonth("XYZ3112") # TRUE - 31st of December is valid
#> [1] TRUE
inspect_birthdaymonth("18DEF02") # FALSE - Multiple numeric components
#> [1] FALSE
inspect_birthdaymonth("XYZ") # FALSE - No numeric components
#> [1] FALSE
inspect_birthdaymonth("ABC1231", format = "MMDD") # TRUE - December 31st is valid
#> [1] TRUE
```
