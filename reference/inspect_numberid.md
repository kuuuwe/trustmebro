# Inspect if a number has the expected length

Check whether a given numeric value has the expected number of digits.

## Usage

``` r
inspect_numberid(number, expected_length)
```

## Arguments

- number:

  A numeric value.

- expected_length:

  An integer specifying the expected number of digits.

## Value

A logical value: \`TRUE\` if \`number\` has the expected length and
consists only of digits, otherwise \`FALSE\`.

## Examples

``` r
inspect_numberid(12345, 5)  # TRUE - 5 digits
#> [1] TRUE
inspect_numberid(1234, 5)    # FALSE - 4 digits
#> [1] FALSE
```
