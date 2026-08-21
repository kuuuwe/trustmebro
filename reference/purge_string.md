# Purge strings in a data frame

Clean specified character columns in a data frame or tibble by removing
non-alphanumeric characters, replacing them with a specified character
(default is "#"). Also replaces NA values and allows for additional
characters to keep in the cleaned strings. The resulting strings are
converted to uppercase.

## Usage

``` r
purge_string(data, ..., replacement = "#", keep = "")
```

## Arguments

- data:

  A data frame or tibble containing columns to be cleaned.

- ...:

  Variables to clean. If none are provided, all character columns will
  be processed.

- replacement:

  A character string used to replace unwanted characters and empty
  strings. Default is "#".

- keep:

  A character string containing any additional characters that should be
  retained in the cleaned strings.

## Value

A data frame or tibble with the specified character columns cleaned and
modified as per the given parameters.

## Examples

``` r
# Example data
print(sailor_students)
#> # A tibble: 12 × 6
#>    sgic             school class   gender  testscore_langauge testscore_calculus
#>    <chr>            <chr>  <chr>   <chr>                <dbl>              <dbl>
#>  1 "MUC__0308"      54321  "3-B "  "Male"                 425                394
#>  2 "HÄT 2701"       22345  "2-A"   "???"                 4596                123
#>  3 "MUK3801"        22345  "  2-B" "Femal…               2456               9485
#>  4 "SAM10"          22345  "3-B"   "Femal…               2345                  3
#>  5 "T0601"          65432  "1-C"   "Femal…               1234                 NA
#>  6 "      UIT3006 " 12345  "3-3"    NA                    123                394
#>  7 "@@@@@@"         NA     "3_2  " "Femal…                 56               2938
#>  8  NA              12345  "3@41"  "   Fe…                986               3948
#>  9 " "              unkown  NA     "Femal…                284                205
#> 10 "MOA2210"        12345  " "     "Femal…                105                 21
#> 11 "MUK3801"        22345  "2-B"   "Femal…               9586                934
#> 12 "T0601"          65432  "1-C"   "Femal…                 NA                764

# Clean all character columns, replacing unwanted characters with "#", retaining "-" 
sailor_students_cleaned <- 
purge_string(sailor_students, sgic, school, class, gender, keep = "-")

# Tibble with cleaned 'sgic', 'school', 'class' and 'gender' columns
print(sailor_students_cleaned)
#> # A tibble: 12 × 6
#>    sgic      school class gender testscore_langauge testscore_calculus
#>    <chr>     <chr>  <chr> <chr>               <dbl>              <dbl>
#>  1 MUC##0308 54321  3-B   MALE                  425                394
#>  2 H#T2701   22345  2-A   ###                  4596                123
#>  3 MUK3801   22345  2-B   FEMALE               2456               9485
#>  4 SAM10     22345  3-B   FEMALE               2345                  3
#>  5 T0601     65432  1-C   FEMALE               1234                 NA
#>  6 UIT3006   12345  3-3   #                     123                394
#>  7 ######    #      3#2   FEMALE                 56               2938
#>  8 #         12345  3#41  FEMALE                986               3948
#>  9 #         UNKOWN #     FEMALE                284                205
#> 10 MOA2210   12345  #     FEMALE                105                 21
#> 11 MUK3801   22345  2-B   FEMALE               9586                934
#> 12 T0601     65432  1-C   FEMALE                 NA                764
```
