# Script to generate .rda files for kenyacensus package
# Run this in R after installing the package source

# Make sure you're in the package root directory
# Then run: source("data-raw/make_data.R")

# This will create all .rda files in the data/ directory
# After that, you can build the package with:
# devtools::build()
# devtools::check()

# The make_data.R script is already created in data-raw/
# Just run it in R:
# source("data-raw/make_data.R")

cat("To build the package:\n")
cat("1. Open R in the package directory\n")
cat("2. Run: source('data-raw/make_data.R')\n")
cat("3. Run: devtools::document()\n")
cat("4. Run: devtools::build()\n")
cat("5. Run: devtools::check()\n")
