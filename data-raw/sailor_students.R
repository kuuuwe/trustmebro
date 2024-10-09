## code to prepare `sailor_students` dataset goes here
library(tibble)

sailor_students <- tibble(
  
  sgic = c("MUC__0308", "HÄT 2701", "MUK3801", "SAM10", "T0601", 
           "      UIT3006 ", "@@@@@@", NA, " ", "MOA2210", 
           "MUK3801", "T0601"),
  
  school = c(54321, 22345, 22345, 22345, 65432, 
             12345, NA, 12345, "unkown", 12345, 
             22345, 65432),
  
  class = c("3-B ", "2-A", "  2-B", "3-B", "1-C",
            "3-3", "3_2  ", "3@41", NA, " ",
            "2-B", "1-C"),
  
  gender = c("Male", "???", "Female", "Female  ", "Female",
             NA, "Female", "   Female", "Female", "Female",
             "Female", "Female"),
  
  testscore_langauge = c(425, 4596, 2456, 2345, 1234,
                         123, 56, 986, 284, 105,
                         9586, NA),
  
  testscore_calculus = c(394, 123, 9485, 3, NA,
                         394, 2938, 3948, 205, 21,
                         934, 764))


usethis::use_data(sailor_students, overwrite = TRUE)
