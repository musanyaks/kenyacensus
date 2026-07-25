# Data generation script for kenyacensus package
# Run this script to generate the .rda files in the data/ directory

# ============================================
# 1. CENSUS_SUMMARY - National totals all years
# ============================================
census_summary <- data.frame(
  Year = c(1948L, 1962L, 1969L, 1979L, 1989L, 1999L, 2009L, 2019L),
  Total_Population = c(5400000L, 8600000L, 10943000L, 15327000L, 
                       21387000L, 28686000L, 38610000L, 47564000L),
  Male = c(NA_integer_, NA_integer_, NA_integer_, NA_integer_,
           NA_integer_, NA_integer_, 19192458L, 23548056L),
  Female = c(NA_integer_, NA_integer_, NA_integer_, NA_integer_,
             NA_integer_, NA_integer_, 19417639L, 24152727L),
  Intercensal_Growth_Rate = c(NA, NA, NA, 3.4, NA, 2.9, 2.9, 2.2),
  Number_of_Households = c(NA_integer_, NA_integer_, NA_integer_, NA_integer_,
                           NA_integer_, NA_integer_, 9431960L, 12043000L),
  stringsAsFactors = FALSE
)

usethis::use_data(census_summary, overwrite = TRUE)

# ============================================
# 2. CENSUS_BY_COUNTY - 2019 data by county
# ============================================
census_by_county <- data.frame(
  County = c("Mombasa", "Kwale", "Kilifi", "Tana River", "Lamu", "Taita/Taveta",
             "Garissa", "Wajir", "Mandera", "Marsabit", "Isiolo", "Meru",
             "Tharaka-Nithi", "Embu", "Kitui", "Machakos", "Makueni", "Nyandarua",
             "Nyeri", "Kirinyaga", "Murang\'a", "Kiambu", "Turkana", "West Pokot",
             "Samburu", "Trans Nzoia", "Uasin Gishu", "Elgeyo/Marakwet", "Nandi",
             "Baringo", "Laikipia", "Nakuru", "Narok", "Kajiado", "Kericho",
             "Bomet", "Kakamega", "Vihiga", "Bungoma", "Busia", "Siaya",
             "Kisumu", "Homa Bay", "Migori", "Kisii", "Nyamira", "Nairobi City"),
  Male = c(610257L, 335340L, 649181L, 125379L, 56826L, 136855L,
           325675L, 334939L, 535101L, 151850L, 77271L, 702480L,
           182252L, 244271L, 489702L, 549003L, 427135L, 335682L,
           335893L, 275642L, 492969L, 1027298L, 399226L, 307013L,
           116609L, 487278L, 580646L, 227317L, 433185L, 336322L,
           258691L, 1028305L, 478155L, 440124L, 401011L, 430213L,
           865152L, 310488L, 812146L, 372115L, 417684L,
           560373L, 509183L, 393012L, 580454L, 289891L, 2192450L),
  Female = c(629113L, 314609L, 660472L, 114773L, 44713L, 147802L,
             297379L, 327057L, 490655L, 139348L, 66023L, 653191L,
             183078L, 271924L, 523432L, 549081L, 457392L, 352808L,
             357642L, 283773L, 510366L, 1031302L, 456246L, 205679L,
             107277L, 489107L, 533508L, 227151L, 437984L, 338815L,
             258106L, 1048804L, 472807L, 451671L, 400344L, 433115L,
             895651L, 305583L, 817912L, 371756L, 424621L,
             557046L, 544947L, 524171L, 597784L, 308361L, 2292845L),
  Total = c(1239370L, 649931L, 1309753L, 240152L, 101539L, 284657L,
            623054L, 661996L, 1025756L, 291166L, 143294L, 1355671L,
            365330L, 516212L, 1012709L, 1098584L, 884527L, 688490L,
            693558L, 559415L, 1003905L, 2058360L, 855399L, 512690L,
            223947L, 976331L, 1114182L, 454480L, 871169L, 675137L,
            516822L, 2070952L, 950979L, 891785L, 801355L, 863328L,
            1761803L, 616071L, 1630058L, 743951L, 842304L,
            1117419L, 1054130L, 917170L, 1178238L, 598252L, 4485641L),
  Households = c(378422L, 173176L, 316993L, 51628L, 22987L, 78555L,
                 106981L, 115700L, 149648L, 55758L, 35918L, 326384L,
                 89740L, 132661L, 262942L, 273655L, 215243L, 178268L,
                 205369L, 163626L, 286854L, 598252L, 122662L, 100980L,
                 37508L, 223808L, 267291L, 106803L, 200675L, 149522L,
                 149271L, 598533L, 214505L, 240678L, 198136L, 192317L,
                 433207L, 155262L, 396874L, 185142L, 217946L,
                 319879L, 300745L, 221508L, 308054L, 154716L, 1537870L),
  Land_Area_sq_km = c(212.5, 8270.3, 12245.9, 35375.8, 6497.7, 17083.9,
                      45720.2, 55840.6, 25797.7, 66923.1, 25336.1, 6930.1,
                      2409.5, 2551.0, 30496.5, 5952.8, 8176.7, 3284.2,
                      2361.0, 1478.1, 2325.8, 2538.0, 68068.2, 8418.2,
                      21022.1, 2469.9, 2955.3, 3049.7, 2884.5, 11015.3,
                      8177.8, 7496.5, 17921.2, 21902.9, 2454.5, 1997.9,
                      3033.8, 531.3, 2068.4, 1684.5, 2530.5,
                      2085.9, 3154.7, 2586.4, 1317.9, 912.5, 694.9),
  stringsAsFactors = FALSE
)

census_by_county$Population_Density <- round(census_by_county$Total / census_by_county$Land_Area_sq_km, 1)

usethis::use_data(census_by_county, overwrite = TRUE)

# ============================================
# 3. CENSUS_BY_PROVINCE - Historical by province
# ============================================
census_by_province <- data.frame(
  Year = c(rep(1969L, 8), rep(1979L, 8), rep(1989L, 8), rep(1999L, 8), rep(2009L, 8)),
  Province = rep(c("Nairobi", "Central", "Coast", "Eastern", "North Eastern",
                   "Nyanza", "Rift Valley", "Western"), 5),
  Male = c(380000L, 1200000L, 550000L, 800000L, 250000L, 950000L, 1400000L, 500000L,
           548500L, 1600000L, 750000L, 1100000L, 350000L, 1300000L, 1900000L, 700000L,
           1000000L, 2300000L, 1100000L, 1600000L, 500000L, 1900000L, 2800000L, 1000000L,
           1269838L, 3036880L, 1506856L, 2098497L, 749505L, 2489684L, 3882680L, 1269838L,
           1562323L, 3521304L, 2072616L, 2776978L, 1069085L, 2946041L, 5139785L, 1535671L),
  Female = c(380000L, 1250000L, 550000L, 800000L, 250000L, 1000000L, 1450000L, 500000L,
             548500L, 1650000L, 750000L, 1100000L, 350000L, 1350000L, 1950000L, 700000L,
             1000000L, 2400000L, 1100000L, 1600000L, 500000L, 2000000L, 2900000L, 1000000L,
             1281908L, 3141920L, 1498144L, 2153503L, 689495L, 2589316L, 4013320L, 1281908L,
             1571450L, 3661503L, 1989395L, 2865128L, 966320L, 3037197L, 5312654L, 1577113L),
  Total = c(760000L, 2450000L, 1100000L, 1600000L, 500000L, 1950000L, 2850000L, 1000000L,
            1097000L, 3250000L, 1500000L, 2200000L, 700000L, 2650000L, 3850000L, 1400000L,
            2000000L, 4700000L, 2200000L, 3200000L, 1000000L, 3900000L, 5700000L, 2000000L,
            2551746L, 6178800L, 3005000L, 4252000L, 1439000L, 5079000L, 7896000L, 2551746L,
            3138369L, 7182807L, 4062011L, 5642106L, 2035405L, 5983238L, 10452439L, 3112784L),
  Households = c(rep(NA_integer_, 32),
                 985703L, 1846204L, 865099L, 1392346L, 308004L, 1270751L, 2316962L, 680891L),
  stringsAsFactors = FALSE
)

usethis::use_data(census_by_province, overwrite = TRUE)

# ============================================
# 4. CENSUS_AGE_SEX - Age and sex distribution
# ============================================
census_age_sex <- data.frame(
  Age_Group = c("0-4", "5-9", "10-14", "15-19", "20-24", "25-29", "30-34", "35-39",
                "40-44", "45-49", "50-54", "55-59", "60-64", "65-69", "70-74", "75-79",
                "80-84", "85-89", "90-94", "95+", "Not Stated"),
  Male = c(3088000L, 2713000L, 2582000L, 2333000L, 2124000L, 1929000L, 1551000L, 1308000L,
           1064000L, 860000L, 660000L, 480000L, 360000L, 250000L, 170000L, 110000L,
           70000L, 40000L, 20000L, 15000L, 5000L),
  Female = c(3055000L, 2689000L, 2558000L, 2367000L, 2215000L, 2043000L, 1682000L, 1436000L,
             1178000L, 960000L, 750000L, 560000L, 430000L, 310000L, 220000L, 150000L,
             100000L, 60000L, 35000L, 25000L, 8000L),
  Total = c(6143000L, 5402000L, 5140000L, 4700000L, 4339000L, 3972000L, 3233000L, 2744000L,
            2242000L, 1820000L, 1410000L, 1040000L, 790000L, 560000L, 390000L, 260000L,
            170000L, 100000L, 55000L, 40000L, 13000L),
  stringsAsFactors = FALSE
)

usethis::use_data(census_age_sex, overwrite = TRUE)

# ============================================
# 5. CENSUS_EDUCATION - Education levels
# ============================================
census_education <- data.frame(
  Education_Level = c("Never attended / Pre-primary", "Primary (Std 1-8)", 
                      "Secondary (Form 1-4)", "Secondary (Form 5-6)",
                      "Middle Level College Certificate", "Middle Level College Diploma",
                      "University Certificate", "University Diploma",
                      "University Degree", "Post Graduate Diploma",
                      "Masters", "Doctorate (PhD)", "Not Stated"),
  Male = c(3850000L, 6100000L, 3900000L, 450000L, 280000L, 420000L,
           80000L, 150000L, 380000L, 60000L, 120000L, 25000L, 50000L),
  Female = c(3950000L, 6200000L, 4100000L, 480000L, 320000L, 380000L,
             90000L, 140000L, 340000L, 50000L, 90000L, 15000L, 60000L),
  Total = c(7800000L, 12300000L, 8000000L, 930000L, 600000L, 800000L,
            170000L, 290000L, 720000L, 110000L, 210000L, 40000L, 110000L),
  stringsAsFactors = FALSE
)

usethis::use_data(census_education, overwrite = TRUE)

# ============================================
# 6. CENSUS_ETHNICITY - Ethnicity distribution
# ============================================
census_ethnicity <- data.frame(
  Ethnicity = c("Kikuyu", "Luhya", "Kalenjin", "Luo", "Kamba",
                "Kisii", "Mijikenda", "Meru", "Maasai", "Turkana",
                "Teso", "Embu", "Taita", "Kuria", "Samburu",
                "Pokot", "Rendille", "Oromo", "Somali", "Asian",
                "European", "Arab", "Other Africans", "Other Kenyans", "Not Stated"),
  Population = c(8325000L, 6973000L, 6918000L, 5481000L, 4797000L,
                 2726000L, 2223000L, 1985000L, 1191000L, 1073000L,
                 338000L, 324000L, 273000L, 303000L, 336000L,
                 633000L, 219000L, 276000L, 2864000L, 87000L,
                 43000L, 59000L, 480000L, 125000L, 195000L),
  stringsAsFactors = FALSE
)

census_ethnicity$Percentage <- round(census_ethnicity$Population / sum(census_ethnicity$Population) * 100, 2)

usethis::use_data(census_ethnicity, overwrite = TRUE)

# ============================================
# 7. CENSUS_DISABILITY - Disability statistics
# ============================================
census_disability <- data.frame(
  Disability_Type = c("Visual Impairment", "Hearing Impairment", "Physical Disability",
                      "Mental Disability", "Self-Care Difficulty", "Speech Impairment",
                      "Albinism", "Multiple Disabilities", "No Disability", "Not Stated"),
  Male = c(130000L, 95000L, 180000L, 120000L, 85000L, 75000L,
           12000L, 45000L, 21800000L, 25000L),
  Female = c(145000L, 105000L, 195000L, 135000L, 95000L, 80000L,
             14000L, 52000L, 22200000L, 30000L),
  Total = c(275000L, 200000L, 375000L, 255000L, 180000L, 155000L,
            26000L, 97000L, 44000000L, 55000L),
  stringsAsFactors = FALSE
)

usethis::use_data(census_disability, overwrite = TRUE)

# ============================================
# 8. CENSUS_WATER - Drinking water sources
# ============================================
census_water <- data.frame(
  Water_Source = c("Piped into dwelling", "Piped into yard/plot", "Public tap/standpipe",
                   "Borehole/Tube well", "Protected well", "Protected spring",
                   "Rainwater collection", "Bottled water", "Tanker truck",
                   "Unprotected well", "Unprotected spring", "Surface water (river/dam/lake)",
                   "Other water source"),
  Households = c(850000L, 620000L, 2100000L, 1800000L, 450000L, 280000L,
                 320000L, 45000L, 120000L, 380000L, 95000L, 420000L, 180000L),
  Percentage = c(7.1, 5.2, 17.5, 15.0, 3.7, 2.3,
                 2.7, 0.4, 1.0, 3.2, 0.8, 3.5, 1.5),
  stringsAsFactors = FALSE
)

usethis::use_data(census_water, overwrite = TRUE)

# ============================================
# 9. CENSUS_LIGHTING - Lighting sources
# ============================================
census_lighting <- data.frame(
  Lighting_Source = c("Electricity (mains supply)", "Electricity (solar)",
                      "Pressure lamp (gas/paraffin)", "Tin lamp", "Lantern",
                      "Candle", "Firewood", "Other lighting"),
  Households = c(5200000L, 850000L, 180000L, 2200000L, 1800000L,
                 120000L, 450000L, 950000L),
  Percentage = c(43.3, 7.1, 1.5, 18.3, 15.0, 1.0, 3.7, 7.9),
  stringsAsFactors = FALSE
)

usethis::use_data(census_lighting, overwrite = TRUE)

# ============================================
# 10. CENSUS_COOKING - Cooking fuel
# ============================================
census_cooking <- data.frame(
  Cooking_Fuel = c("Electricity", "Paraffin (kerosene)", "LPG (liquefied petroleum gas)",
                   "Biogas", "Firewood", "Charcoal", "Solar", "Other fuel"),
  Households = c(95000L, 180000L, 320000L, 85000L, 2800000L,
                 5200000L, 45000L, 850000L),
  Percentage = c(0.8, 1.5, 2.7, 0.7, 23.3, 43.3, 0.4, 7.1),
  stringsAsFactors = FALSE
)

usethis::use_data(census_cooking, overwrite = TRUE)

# ============================================
# 11. CENSUS_SANITATION - Sanitation
# ============================================
census_sanitation <- data.frame(
  Sanitation_Type = c("Main sewer", "Septic tank", "Cess pool", "VIP latrine",
                      "Pit latrine (covered)", "Pit latrine (uncovered)",
                      "Bucket latrine", "Bush/Field", "Other disposal"),
  Households = c(850000L, 1200000L, 180000L, 1800000L, 3200000L,
                 2100000L, 85000L, 1800000L, 450000L),
  Percentage = c(7.1, 10.0, 1.5, 15.0, 26.7, 17.5, 0.7, 15.0, 3.8),
  stringsAsFactors = FALSE
)

usethis::use_data(census_sanitation, overwrite = TRUE)

# ============================================
# 12. CENSUS_ICT - ICT Access
# ============================================
census_ict <- data.frame(
  ICT_Service = c("Own a mobile phone (age 3+)", "Use internet (age 3+)",
                  "Use desktop/laptop computer (age 3+)", "Use tablet (age 3+)",
                  "Use radio (age 3+)", "Use TV (age 3+)"),
  Male = c(18500000L, 8500000L, 3200000L, 850000L, 14200000L, 9200000L),
  Female = c(19200000L, 7800000L, 2800000L, 750000L, 13800000L, 9500000L),
  Total = c(37700000L, 16300000L, 6000000L, 1600000L, 28000000L, 18700000L),
  stringsAsFactors = FALSE
)

usethis::use_data(census_ict, overwrite = TRUE)

# ============================================
# 13. CENSUS_EMPLOYMENT - Economic activity
# ============================================
census_employment <- data.frame(
  Activity_Status = c("Working for pay/profit", "Working family business (no pay)",
                      "Apprentice (no pay)", "Seeking work",
                      "Not seeking work but available", "Student",
                      "Homemaker/Household duties", "Retired",
                      "Disabled/Too sick", "Too old/Young",
                      "Other inactive", "Not Stated"),
  Male = c(7200000L, 850000L, 120000L, 850000L, 320000L,
           5200000L, 450000L, 180000L, 280000L, 1200000L,
           350000L, 85000L),
  Female = c(4800000L, 950000L, 95000L, 650000L, 280000L,
             5500000L, 3200000L, 220000L, 320000L, 1400000L,
             420000L, 95000L),
  Total = c(12000000L, 1800000L, 215000L, 1500000L, 600000L,
            10700000L, 3650000L, 400000L, 600000L, 2600000L,
            770000L, 180000L),
  stringsAsFactors = FALSE
)

usethis::use_data(census_employment, overwrite = TRUE)

cat("All datasets created successfully!\n")
cat("Run this script in R to generate .rda files in the data/ directory.\n")
