# kenyacensus 1.0.0

## Initial Release

- Added 13 datasets covering Kenya census data from 1948-2019
- Included 8 visualization and utility functions
- Added comprehensive documentation and vignette
- All data sourced from Kenya National Bureau of Statistics (KNBS)

### Datasets
- `census_summary`: National totals 1948-2019
- `census_by_county`: 47 counties, 2019
- `census_by_province`: 8 provinces, 1969-2009
- `census_age_sex`: Age & sex distribution, 2019
- `census_education`: Education levels, 2019
- `census_ethnicity`: Ethnic groups, 2019
- `census_disability`: Disability statistics, 2019
- `census_water`: Drinking water sources, 2019
- `census_lighting`: Lighting sources, 2019
- `census_cooking`: Cooking fuel, 2019
- `census_sanitation`: Sanitation facilities, 2019
- `census_ict`: ICT access, 2019
- `census_employment`: Economic activity, 2019

### Functions
- `list_datasets()`: List all available datasets
- `get_county_data()`: Retrieve county-level data
- `get_census_year()`: Retrieve data by census year
- `plot_census_trend()`: Plot population over time
- `plot_population_pyramid()`: Plot age-sex pyramid
- `plot_county_map()`: Plot county population chart
- `calculate_growth_rate()`: Calculate intercensal growth
- `compare_counties()`: Compare multiple counties
- `search_counties()`: Search counties by name
