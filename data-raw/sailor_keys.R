## code to prepare `sailor_keys` dataset goes here
library(tibble)

sailor_keys <- tibble(
  
  schoolyear = c(2223, 2223, 2223, 2223, 2223, 
                 2223, 2223, 2223, 2223, 2223,
                 2324, 2324, 2324, 2324, 2324,
                 2324, 2324, 2324, 2324, 2324),
  
  guid = c("3F5A2C", "9B1D7E", "F0E5C1", "7A4B3D", "8C9A2F", 
           "1F4D9B", "E2B67A", "4C3E1D", "AA9D2F", "5B8E3C",
           "3F5A2C", "9B1D7E", "F0E5C1", "7A4B3D", "8C9A2F", 
           "1F4D9B", "E2B67A", "4C3E1D", "AA9D2F", "5B8E3C"),
  
  name = c("Usagi Tsukino", "Ami Mizuno", "Rei Hino", "Makoto Kino", "Minako Aino",
           "Mamoru Chiba", "Haruka Tenou", "Michiru Kaioh", "Setsuna Meiou", "Hotaru Tomoe",
           "Usagi Tsukino", "Ami Mizuno", "Rei Hino", "Makoto Kino", "Minako Aino",
           "Mamoru Chiba", "Haruka Tenou", "Michiru Kaioh", "Setsuna Meiou", "Hotaru Tomoe"),
  
  school = c("Juban Junior High School", "Juban Junior High School", "Juban Junior High School",
             "Juban Junior High School", "Juban Junior High School", "Shiba High School",
             "Juban High School", "Juban High School", "Juban High School", "Mugen Academy",
             "Juban Junior High School", "Juban Junior High School", "Juban Junior High School",
             "Juban Junior High School", "Juban Junior High School", "Shiba High School",
             "Juban High School", "Juban High School", "Juban High School", "Mugen Academy"),
  
  schoolnumber = c(12345, 12345, 12345,
                   12345, 12345, 54321,
                   22345, 22345, 22345, 65432,
                   12345, 12345, 12345,
                   12345, 12345, 54321,
                   22345, 22345, 22345, 65432),
  
  class = c("3-3", "3-2", "3-1", "3-4", "3-2", 
            "3-B", "2-A", "2-B", "3-B", "1-C",
            "4-3", "4-2", "4-1", "4-4", "4-2", 
            "4-B", "3-A", "3-B", "4-B", "2-C"),
  
  grade_level = c(9, 9, 9, 9, 9,
                  11, 10, 10, 10, 8,
                  10, 10, 10, 10, 10,
                  12, 11, 11, 11, 9),
  
  birthday = as.Date(c("1978-06-30", "1979-09-10", "1978-11-30", "1979-12-05", "1979-10-22",
                       "1978-08-03", "1978-01-27", "1978-01-06", "1978-10-29", "1979-01-06",
                       "1978-06-30", "1979-09-10", "1978-11-30", "1979-12-05", "1979-10-22",
                       "1978-08-03", "1978-01-27", "1978-01-06", "1978-10-29", "1979-01-06")),
  
  sex = c("F", "F", "F", "F", "F",
          "M", "F", "F", "F", "F",
          "F", "F", "F", "F", "F",
          "M", "F", "F", "F", "F"),
  
  #sgic1 = first letter firstname, last letter first name, first letter lastname, birthday, birthmonth
  sgic1 = c("UIT3006", "AIM1009", "RIH3011", "MOK0512", "MOA2210", 
            "MUC0308", "HAT2701", "MUK0601", "SAM2910", "HUT0601",
            "UIT3006", "AIM1009", "RIH3011", "MOK0512", "MOA2210", 
            "MUC0308", "HAT2701", "MUK0601", "SAM2910", "HUT0601"),
  
  #sgic2 = second letter first name, third letter first name, birthday
  sgic2 = c("SA30", "MI10", "EI30", "AK05", "IN22", 
            "AM03", "AR27", "IC06", "ET29", "OT06",
            "SA30", "MI10", "EI30", "AK05", "IN22", 
            "AM03", "AR27", "IC06", "ET29", "OT06"),
  
  #sgic3 = first four letters lastname, birthmonth
  sgic3 = c("TSU03", "MIZ09", "HIN11", "KIN12", "AIN10",
            "CHI08", "TEN01", "KAI01", "MEI10", "TOM01",
            "TSU03", "MIZ09", "HIN11", "KIN12", "AIN10",
            "CHI08", "TEN01", "KAI01", "MEI10", "TOM01"))

usethis::use_data(sailor_keys, overwrite = TRUE)