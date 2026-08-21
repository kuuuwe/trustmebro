# Inspect SGICs

Linking survey data with SGICs (Subject Generated Identification-Codes)?
Awesome! Just remember, you need to validate those IDs. That’s how you
get clean data and make sure the link-up goes smoothly.

This vignette shows you:

- How to perform plausibility checks on different SGIC components.

- How to perform plausibility checks on non-SGIC variables that may
  serve as additional identifiers.

- How to detect duplicate cases using a combination of variables as
  unique identifiers.

To check the plausibility of ID-related variables in a dataset,
`trustmebro` provides several functions beginning with the prefix
*inspect*. Every *inspect*-function returns a boolean value, indicating
whether a value has passed or failed the plausibility check.

We\`ll start by loading trustmebro and dplyr:

``` r

library(trustmebro)
library(dplyr)
```

## Data: sailor_students

The survey data we use is the
[`trustmebro::sailor_students`](https://kuuuwe.github.io/trustmebro/reference/sailor_students.md)
dataset. It contains fictional student assessment data from students of
the sailor moon universe.

``` r

sailor_students
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

## SGIC Plausibility

The variable `sgic` stores SGICs created by students. Each SGIC is a
seven-character string created according to the following instructions:

Characters 1-3 (letters):

- First letter of given name (1st character)

- Last letter of given name (2nd character)

- First letter of family name (3rd character)

Characters 4-7 (digits):

- Birthday (4th and 5th character)

- Month of birth (6th and 7th character)

### Check Character IDs

We can use
[`trustmebro::inspect_characterid`](https://kuuuwe.github.io/trustmebro/reference/inspect_characterid.md)
to check if the provided SGICs adhere to the expected pattern of three
letters followed by four digits. The expected structure can be defined
using the regular expression `"^[A-Za-z]{3}[0-9]{4}$"`, which we can
then pass to the function using the `pattern =` argument. For seamless
integration into your data workflow, this function can be conveniently
combined with
[`dplyr::mutate`](https://dplyr.tidyverse.org/reference/mutate.html):

``` r

sailor_students %>% 
  mutate(structure_check = 
           inspect_characterid(
             sgic, pattern = "^[A-Za-z]{3}[0-9]{4}$")) %>%
  select(sgic, structure_check)
#> # A tibble: 12 × 2
#>    sgic             structure_check
#>    <chr>            <lgl>          
#>  1 "MUC__0308"      FALSE          
#>  2 "HÄT 2701"       FALSE          
#>  3 "MUK3801"        TRUE           
#>  4 "SAM10"          FALSE          
#>  5 "T0601"          FALSE          
#>  6 "      UIT3006 " FALSE          
#>  7 "@@@@@@"         FALSE          
#>  8  NA              FALSE          
#>  9 " "              FALSE          
#> 10 "MOA2210"        TRUE           
#> 11 "MUK3801"        TRUE           
#> 12 "T0601"          FALSE
```

We created
[`trustmebro::inspect_characterid`](https://kuuuwe.github.io/trustmebro/reference/inspect_characterid.md)
with SGICs in mind, but of course, any other non-SGIC strings can also
be checked using a specified regular expression.

### Check Birthdate-Components

Since the SGIC should end with a date of birth, you can verify the
plausibility of this date of birth using
[`trustmebro::inspect_birthdaymonth`](https://kuuuwe.github.io/trustmebro/reference/inspect_birthdaymonth.md).
This function checks if a string contains exactly four digits
representing a valid date of birth. As before, you can combine
[`trustmebro::inspect_birthdaymonth`](https://kuuuwe.github.io/trustmebro/reference/inspect_birthdaymonth.md)
with
[`dplyr::mutate`](https://dplyr.tidyverse.org/reference/mutate.html) to
generate a plausibility check variable:

``` r

sailor_students %>% 
  mutate(birthdate_check = 
           inspect_birthdaymonth(sgic)) %>%
  select(sgic, birthdate_check)
#> # A tibble: 12 × 2
#>    sgic             birthdate_check
#>    <chr>            <lgl>          
#>  1 "MUC__0308"      TRUE           
#>  2 "HÄT 2701"       TRUE           
#>  3 "MUK3801"        FALSE          
#>  4 "SAM10"          FALSE          
#>  5 "T0601"          TRUE           
#>  6 "      UIT3006 " TRUE           
#>  7 "@@@@@@"         FALSE          
#>  8  NA              FALSE          
#>  9 " "              FALSE          
#> 10 "MOA2210"        TRUE           
#> 11 "MUK3801"        FALSE          
#> 12 "T0601"          TRUE
```

Some SGICs only use the single day or month a person was born. In this
case, you can use of
[`trustmebro::inspect_birthday`](https://kuuuwe.github.io/trustmebro/reference/inspect_birthday.md)
or
[`trustmebro::inspect_birthmonth`](https://kuuuwe.github.io/trustmebro/reference/inspect_birthmonth.md)
accordingly.

## Non-SGIC variables’ plausibility

Besides a SGIC, other variables in a given dataset might be used to
identify cases. As mentioned above,
[`trustmebro::inspect_characterid`](https://kuuuwe.github.io/trustmebro/reference/inspect_characterid.md)
can be used for any string that should follow a specific pattern.
Furthermore, this package also provides functions for checking other
data types beyond strings.

### Check Numbers

We can use
[`trustmebro::inspect_numberid`](https://kuuuwe.github.io/trustmebro/reference/inspect_numberid.md)
to check if a number matches an expected length. In our dataset,
`school` should be a five-digit number. combined with
[`dplyr::mutate`](https://dplyr.tidyverse.org/reference/mutate.html), we
can add a plausibility variable for the schoolnumber, just as we did
before:

``` r

sailor_students %>% 
  mutate(school_check = 
           inspect_numberid(school, 5)) %>%
  select(school, school_check)
#> # A tibble: 12 × 2
#>    school school_check
#>    <chr>  <lgl>       
#>  1 54321  TRUE        
#>  2 22345  TRUE        
#>  3 22345  TRUE        
#>  4 22345  TRUE        
#>  5 65432  TRUE        
#>  6 12345  TRUE        
#>  7 NA     FALSE       
#>  8 12345  TRUE        
#>  9 unkown FALSE       
#> 10 12345  TRUE        
#> 11 22345  TRUE        
#> 12 65432  TRUE
```

### Check the presence of a value within the recode map

In the process of using non-SGIC variables as identifiers, categorical
data is often recoded to ensure consistency within a workflow. We can
use
[`trustmebro::inspect_valinvec`](https://kuuuwe.github.io/trustmebro/reference/inspect_valinvec.md)
to check if a value exists in a recode map. The recode map should be a
named vector, where the names represent the keys. In our dataset, we
want to inspect if all values in `gender` conform to this recode map:

``` r

recode_gender <- c(Male = "M", Female = "F")
```

The function checks if a value is present as a key. Combine with
[`dplyr::mutate`](https://dplyr.tidyverse.org/reference/mutate.html) to
add a variable that contains the check results:

``` r

sailor_students %>% 
  mutate(gender_check = 
           inspect_valinvec(gender, recode_gender)) %>%
  select(gender, gender_check)
#> # A tibble: 12 × 2
#>    gender      gender_check
#>    <chr>       <lgl>       
#>  1 "Male"      TRUE        
#>  2 "???"       FALSE       
#>  3 "Female"    TRUE        
#>  4 "Female  "  FALSE       
#>  5 "Female"    TRUE        
#>  6  NA         FALSE       
#>  7 "Female"    TRUE        
#>  8 "   Female" FALSE       
#>  9 "Female"    TRUE        
#> 10 "Female"    TRUE        
#> 11 "Female"    TRUE        
#> 12 "Female"    TRUE
```

## Identify Duplicate Cases

So far, we’ve checked if `SGIC`, `school` and `gender` contain plausible
values. Last, we want to ensure that these variables, when used together
as identifiers, uniquely identify a single case and that there are no
duplicate entries based on these variables.
[`trustmebro::find_dupes`](https://kuuuwe.github.io/trustmebro/reference/find_dupes.md)
checks whether the combination of identifiers is unique by adding a
has_dupes variable to the dataset. To find duplicates in your data, use
it like this:

``` r

sailor_students %>% find_dupes(school, sgic, gender) %>%
  select(school, sgic, gender, has_dupes)
#> # A tibble: 12 × 4
#>    school sgic             gender      has_dupes
#>    <chr>  <chr>            <chr>       <lgl>    
#>  1 54321  "MUC__0308"      "Male"      FALSE    
#>  2 22345  "HÄT 2701"       "???"       FALSE    
#>  3 22345  "MUK3801"        "Female"    TRUE     
#>  4 22345  "SAM10"          "Female  "  FALSE    
#>  5 65432  "T0601"          "Female"    TRUE     
#>  6 12345  "      UIT3006 "  NA         FALSE    
#>  7 NA     "@@@@@@"         "Female"    FALSE    
#>  8 12345   NA              "   Female" FALSE    
#>  9 unkown " "              "Female"    FALSE    
#> 10 12345  "MOA2210"        "Female"    FALSE    
#> 11 22345  "MUK3801"        "Female"    TRUE     
#> 12 65432  "T0601"          "Female"    TRUE
```
