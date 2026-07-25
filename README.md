# kenyacensus

[![License: CC0-1.0](https://img.shields.io/badge/License-CC0%201.0-lightgrey.svg)](https://creativecommons.org/publicdomain/zero/1.0/)

> Comprehensive Kenya Population and Housing Census Data (1948-2019)

## Overview

`kenyacensus` is an R package providing complete access to Kenya's Population and Housing Census data from 1948 to 2019. All data is sourced from the **Kenya National Bureau of Statistics (KNBS)**.

## Features

- **13 datasets** covering all major census themes
- **8 historical census years** (1948, 1962, 1969, 1979, 1989, 1999, 2009, 2019)
- **47 counties** with full 2019 demographic, housing, and socio-economic data
- **Built-in visualization functions** for population trends, pyramids, and county comparisons
- **Helper functions** for data access and analysis

## Datasets Included

| Dataset | Description | Year |
|---------|-------------|------|
| `census_summary` | National totals | 1948-2019 |
| `census_by_county` | All 47 counties | 2019 |
| `census_by_province` | 8 provinces | 1969-2009 |
| `census_age_sex` | Age & sex distribution | 2019 |
| `census_education` | Education levels | 2019 |
| `census_ethnicity` | Ethnic groups | 2019 |
| `census_disability` | Disability types | 2019 |
| `census_water` | Drinking water sources | 2019 |
| `census_lighting` | Lighting sources | 2019 |
| `census_cooking` | Cooking fuel | 2019 |
| `census_sanitation` | Sanitation facilities | 2019 |
| `census_ict` | ICT access | 2019 |
| `census_employment` | Economic activity | 2019 |

## Installation

```r
# Install devtools if not already installed
install.packages("devtools")

# Install from GitHub (when published)
devtools::install_github("musanyaks/kenyacensus")

# Or install from local source
devtools::install("path/to/kenyacensus")
```

## Quick Start

```r
library(kenyacensus)

# List all datasets
list_datasets()

# View national population trend
census_summary

# Get data for specific counties
get_county_data(c("Nairobi City", "Mombasa", "Kisumu"))

# Plot population trend
plot_census_trend()

# Plot population pyramid
plot_population_pyramid()

# Compare top counties
plot_county_map(top_n = 15)
```

## Example Analysis

```r
# Calculate growth rate between censuses
calculate_growth_rate(2009, 2019)
#> Growth rate 2009-2019: 2.15% per year

# Find most densely populated counties
head(census_by_county[order(-census_by_county$Population_Density), ], 5)

# Compare education levels by gender
census_education

# Check ICT penetration
census_ict
```

## Data Source

- **Kenya National Bureau of Statistics (KNBS)**: https://www.knbs.or.ke/
- **OpenAfrica (CKAN)**: https://open.africa/

## License

This package is released under CC0 (Public Domain). The original data remains the property of KNBS.

## Contributing

Contributions are welcome! Please open an issue or pull request on GitHub.

## Citation

When using this data, please cite:

> Kenya National Bureau of Statistics (KNBS). Kenya Population and Housing Census 2019.
> Available at: https://www.knbs.or.ke/
