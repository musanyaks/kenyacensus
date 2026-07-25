# Export all datasets as CSV files
# Run this in R to create CSV versions of all datasets

library(kenyacensus)

data_dir <- "inst/extdata"

write.csv(census_summary, file.path(data_dir, "census_summary.csv"), row.names = FALSE)
write.csv(census_by_county, file.path(data_dir, "census_by_county.csv"), row.names = FALSE)
write.csv(census_by_province, file.path(data_dir, "census_by_province.csv"), row.names = FALSE)
write.csv(census_age_sex, file.path(data_dir, "census_age_sex.csv"), row.names = FALSE)
write.csv(census_education, file.path(data_dir, "census_education.csv"), row.names = FALSE)
write.csv(census_ethnicity, file.path(data_dir, "census_ethnicity.csv"), row.names = FALSE)
write.csv(census_disability, file.path(data_dir, "census_disability.csv"), row.names = FALSE)
write.csv(census_water, file.path(data_dir, "census_water.csv"), row.names = FALSE)
write.csv(census_lighting, file.path(data_dir, "census_lighting.csv"), row.names = FALSE)
write.csv(census_cooking, file.path(data_dir, "census_cooking.csv"), row.names = FALSE)
write.csv(census_sanitation, file.path(data_dir, "census_sanitation.csv"), row.names = FALSE)
write.csv(census_ict, file.path(data_dir, "census_ict.csv"), row.names = FALSE)
write.csv(census_employment, file.path(data_dir, "census_employment.csv"), row.names = FALSE)

cat("All CSV files exported to inst/extdata/\n")
