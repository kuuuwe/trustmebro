# Identify duplicate cases

Identify duplicate cases in a data frame or tibble based on specific
variables. A logical column \`has_dupes\` is added, that indicates
whether or not a row has duplicate values based on the provided
variables.

## Usage

``` r
find_dupes(data, ...)
```

## Arguments

- data:

  A data frame or tibble

- ...:

  Variable names to check for duplicates

## Value

The original data frame or tibble with an additional logical column
'has_dupes' which is \`TRUE\` for rows that have duplicates based on the
specified variables and \`FALSE\` otherwise.

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

# Find duplicate cases based on 'sgic', 'school' and 'class'
sailor_students_dupes <- find_dupes(sailor_students, sgic, school, class)

# Rows where 'has_dupes' is `TRUE` indicate duplicates based on the provided columns
print(sailor_students_dupes)
#> # A tibble: 12 × 7
#>    sgic      school class gender testscore_langauge testscore_calculus has_dupes
#>    <chr>     <chr>  <chr> <chr>               <dbl>              <dbl> <lgl>    
#>  1 "MUC__03… 54321  "3-B… "Male"                425                394 FALSE    
#>  2 "HÄT 270… 22345  "2-A" "???"                4596                123 FALSE    
#>  3 "MUK3801" 22345  "  2… "Fema…               2456               9485 FALSE    
#>  4 "SAM10"   22345  "3-B" "Fema…               2345                  3 FALSE    
#>  5 "T0601"   65432  "1-C" "Fema…               1234                 NA TRUE     
#>  6 "      U… 12345  "3-3"  NA                   123                394 FALSE    
#>  7 "@@@@@@"  NA     "3_2… "Fema…                 56               2938 FALSE    
#>  8  NA       12345  "3@4… "   F…                986               3948 FALSE    
#>  9 " "       unkown  NA   "Fema…                284                205 FALSE    
#> 10 "MOA2210" 12345  " "   "Fema…                105                 21 FALSE    
#> 11 "MUK3801" 22345  "2-B" "Fema…               9586                934 FALSE    
#> 12 "T0601"   65432  "1-C" "Fema…                 NA                764 TRUE     
```
