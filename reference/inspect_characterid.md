# Inspect if a string matches an expected pattern

Check whether a given string matches a specified pattern using regular
expressions (regex). The string is assumed to be a code (e.g., a SGIC),
which should follow a predefined format.

## Usage

``` r
inspect_characterid(code, pattern)
```

## Arguments

- code:

  A character string containing a SGIC or similar code that should
  follow a predefined format.

- pattern:

  A character string specifying the expected pattern using regular
  expressions (regex). The pattern defines the format \`code\` should
  match.

## Value

A logical value: \`TRUE\` if the code matches the expected pattern,
otherwise \`FALSE\`

## Examples

``` r
inspect_characterid("ABC1234", "^[A-Za-z]{3}[0-9]{4}$") #TRUE - Matches the pattern
#> [1] TRUE
inspect_characterid("12DBG45FG", "^[A-Za-z]{3}[0-9]{4}$") #FALSE - Does not match the pattern
#> [1] FALSE
```
