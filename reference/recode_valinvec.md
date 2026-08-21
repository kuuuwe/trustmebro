# Recode a variable

Recode a specified variable in a data frame or tibble based on a
provided recode map. If the recode map is empty, the original variable
is retained under a new name.

## Usage

``` r
recode_valinvec(data, var, recode_map, new_var)
```

## Arguments

- data:

  A data frame or tibble.

- var:

  A variable to be recoded.

- recode_map:

  A named vector specifying the recode map.

- new_var:

  Name of the new variable holding the recoded values.

## Value

A data frame or tibble with the new variable added.

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

# Define a recode map for gender
recode_map_gender <- c("Female" = "F", "Male" = "M", "Other" = "X")

# Recode gender
sailor_students_recoded <- 
recode_valinvec(sailor_students, gender, recode_map_gender, recode_gender)

# A tibble with a recoded gender variable
print(sailor_students_recoded)
#> # A tibble: 12 × 7
#>    sgic  school class gender testscore_langauge testscore_calculus recode_gender
#>    <chr> <chr>  <chr> <chr>               <dbl>              <dbl> <chr>        
#>  1 "MUC… 54321  "3-B… "Male"                425                394 "M"          
#>  2 "HÄT… 22345  "2-A" "???"                4596                123 "???"        
#>  3 "MUK… 22345  "  2… "Fema…               2456               9485 "F"          
#>  4 "SAM… 22345  "3-B" "Fema…               2345                  3 "Female  "   
#>  5 "T06… 65432  "1-C" "Fema…               1234                 NA "F"          
#>  6 "   … 12345  "3-3"  NA                   123                394  NA          
#>  7 "@@@… NA     "3_2… "Fema…                 56               2938 "F"          
#>  8  NA   12345  "3@4… "   F…                986               3948 "   Female"  
#>  9 " "   unkown  NA   "Fema…                284                205 "F"          
#> 10 "MOA… 12345  " "   "Fema…                105                 21 "F"          
#> 11 "MUK… 22345  "2-B" "Fema…               9586                934 "F"          
#> 12 "T06… 65432  "1-C" "Fema…                 NA                764 "F"          
```
