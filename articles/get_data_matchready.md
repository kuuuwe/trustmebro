# Get Data Matchready

Want to link up your data from different sources? Awesome! Just a
heads-up, you’ll probably need to do some cleaning first. Let’s dive in
and see how our package makes getting your SGIC data ready super easy.

We\`ll start by loading trustmebro:

``` r

library(trustmebro)
```

## Data

Our key data set
[`trustmebro::sailor_keys`](https://kuuuwe.github.io/trustmebro/reference/sailor_keys.md)
is a longitudinal data set in long format. It is a tibble with 20 rows
and 12 columns.

This data should be linked with our survey data
[`trustmebro::sailor_students`](https://kuuuwe.github.io/trustmebro/reference/sailor_students.md),
a tibble with 12 rows and 6 columns.

Let us take a quick look at the survey data:

``` r

print(trustmebro::sailor_students)
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
```

## Replace non-alphanumeric characters you don’t want to deal with

Yep, this data needs cleaning. There’s a lot of unnecessary stuff, like
whitespace. You see this all the time with survey data strings. We can
replace all non-alphanumeric characters in string-variables of our data
set
[`trustmebro::sailor_students`](https://kuuuwe.github.io/trustmebro/reference/sailor_students.md)
using
[`trustmebro::purge_string`](https://kuuuwe.github.io/trustmebro/reference/purge_string.md):

``` r

purge_string(sailor_students, replacement = "#")
#> # A tibble: 12 × 6
#>    sgic      school class gender testscore_langauge testscore_calculus
#>    <chr>     <chr>  <chr> <chr>               <dbl>              <dbl>
#>  1 MUC##0308 54321  3#B   MALE                  425                394
#>  2 H#T2701   22345  2#A   ###                  4596                123
#>  3 MUK3801   22345  2#B   FEMALE               2456               9485
#>  4 SAM10     22345  3#B   FEMALE               2345                  3
#>  5 T0601     65432  1#C   FEMALE               1234                 NA
#>  6 UIT3006   12345  3#3   #                     123                394
#>  7 ######    #      3#2   FEMALE                 56               2938
#>  8 #         12345  3#41  FEMALE                986               3948
#>  9 #         UNKOWN #     FEMALE                284                205
#> 10 MOA2210   12345  #     FEMALE                105                 21
#> 11 MUK3801   22345  2#B   FEMALE               9586                934
#> 12 T0601     65432  1#C   FEMALE                 NA                764
```

Please note that since we deal with data collected in Germany, umlauts
remain unchanged from this.

## Recode variables

A few variables need recoding for further analysis. For that, we can
provide a recode map:

``` r

recode_map <- c(MALE = "M", FEMALE = "F")
```

The recode_map is a named vector where the names represent categories
(in this case, “Male” and “Female”), and the values (“M” and “F”) are
the corresponding codes used for those categories. It is used to map
full category labels to shorter, standardized values. We can pass it to
[`trustmebro::recode_valinvec`](https://kuuuwe.github.io/trustmebro/reference/recode_valinvec.md),
to recode the values accordingly. A new variable will be added that
contains the recoded values

``` r

recode_valinvec(purge_string(sailor_students, replacement = "#"), gender, recode_map, gender_recode)
#> # A tibble: 12 × 7
#>    sgic  school class gender testscore_langauge testscore_calculus gender_recode
#>    <chr> <chr>  <chr> <chr>               <dbl>              <dbl> <chr>        
#>  1 MUC#… 54321  3#B   MALE                  425                394 M            
#>  2 H#T2… 22345  2#A   ###                  4596                123 ###          
#>  3 MUK3… 22345  2#B   FEMALE               2456               9485 F            
#>  4 SAM10 22345  3#B   FEMALE               2345                  3 F            
#>  5 T0601 65432  1#C   FEMALE               1234                 NA F            
#>  6 UIT3… 12345  3#3   #                     123                394 #            
#>  7 ####… #      3#2   FEMALE                 56               2938 F            
#>  8 #     12345  3#41  FEMALE                986               3948 F            
#>  9 #     UNKOWN #     FEMALE                284                205 F            
#> 10 MOA2… 12345  #     FEMALE                105                 21 F            
#> 11 MUK3… 22345  2#B   FEMALE               9586                934 F            
#> 12 T0601 65432  1#C   FEMALE                 NA                764 F
```
