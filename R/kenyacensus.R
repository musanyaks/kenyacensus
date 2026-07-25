# Kenya Census Data Package
#
# A comprehensive collection of Kenya Population and Housing Census data
# from 1948 to 2019, sourced from the Kenya National Bureau of Statistics (KNBS).
#
# @docType package
# @name kenyacensus
# @aliases kenyacensus-package
# @keywords internal
"_PACKAGE"

# Declare global variables to avoid R CMD check NOTEs
utils::globalVariables(c(
  "census_summary", "census_by_county", "census_by_province",
  "census_age_sex", "census_education", "census_ethnicity",
  "census_disability", "census_water", "census_lighting",
  "census_cooking", "census_sanitation", "census_ict",
  "census_employment",
  "Year", "Total_Population", "County", "Total", "Population_Density",
  "Age", "Population", "Sex", ".data"
))

# List All Available Datasets
#
# Returns a data frame listing all datasets available in the package
# with their descriptions and dimensions.
#
# @return A data frame with columns: Dataset, Description, Dimensions
# @export
# @examples
# list_datasets()
list_datasets <- function() {
  datasets <- data.frame(
    Dataset = c("census_summary", "census_by_county", "census_by_province",
                "census_age_sex", "census_education", "census_ethnicity",
                "census_disability", "census_water", "census_lighting",
                "census_cooking", "census_sanitation", "census_ict",
                "census_employment"),
    Description = c(
      "National population totals from 1948-2019",
      "2019 census data for all 47 counties",
      "Historical census data by 8 provinces (1969-2009)",
      "Age and sex distribution (2019)",
      "Education levels for population age 3+ (2019)",
      "Ethnicity distribution (2019)",
      "Disability statistics by type (2019)",
      "Drinking water sources for households (2019)",
      "Lighting sources for households (2019)",
      "Cooking fuel types for households (2019)",
      "Sanitation and waste disposal methods (2019)",
      "ICT access: mobile, internet, computers (2019)",
      "Economic activity status for age 5+ (2019)"
    ),
    stringsAsFactors = FALSE
  )
  
  dims <- sapply(datasets$Dataset, function(x) {
    if (exists(x, envir = .GlobalEnv)) {
      d <- dim(get(x, envir = .GlobalEnv))
      paste(d[1], "x", d[2])
    } else {
      "Load package to see"
    }
  })
  
  datasets$Dimensions <- dims
  return(datasets)
}

# Get County-Level Data
#
# Retrieve 2019 census data for specific counties.
#
# @param counties Character vector of county names. Use "all" for all counties.
# @param variables Character vector of variables to return. Default is all.
# @return A data frame with selected counties and variables
# @export
# @examples
# get_county_data("Nairobi City")
# get_county_data(c("Nairobi City", "Mombasa", "Kisumu"))
# get_county_data("all", c("County", "Total", "Population_Density"))
get_county_data <- function(counties = "all", variables = NULL) {
  if (!exists("census_by_county")) {
    stop("census_by_county dataset not loaded. Please load the kenyacensus package.")
  }
  
  data <- census_by_county
  
  if (!identical(counties, "all")) {
    data <- data[data$County %in% counties, ]
    if (nrow(data) == 0) {
      stop("No matching counties found. Check spelling.")
    }
  }
  
  if (!is.null(variables)) {
    available <- colnames(data)
    missing <- setdiff(variables, available)
    if (length(missing) > 0) {
      warning("Variables not found: ", paste(missing, collapse = ", "))
    }
    variables <- intersect(variables, available)
    if (length(variables) > 0) {
      data <- data[, variables, drop = FALSE]
    }
  }
  
  return(data)
}

# Get Census Data by Year
#
# Retrieve national census data for specific years.
#
# @param years Numeric vector of years. Use "all" for all years.
# @return A data frame with census data for selected years
# @export
# @examples
# get_census_year(2019)
# get_census_year(c(1969, 1979, 1989, 1999, 2009, 2019))
get_census_year <- function(years = "all") {
  if (!exists("census_summary")) {
    stop("census_summary dataset not loaded. Please load the kenyacensus package.")
  }
  
  data <- census_summary
  
  if (!identical(years, "all")) {
    data <- data[data$Year %in% years, ]
    if (nrow(data) == 0) {
      stop("No data for specified years. Available: ", paste(data$Year, collapse = ", "))
    }
  }
  
  return(data)
}

# Plot Kenya Population Trend Over Time
#
# Creates a line plot showing Kenya population growth from 1948 to 2019.
#
# @param log_scale Logical. Use logarithmic y-axis? Default FALSE.
# @return A ggplot object
# @export
# @examples
# plot_census_trend()
plot_census_trend <- function(log_scale = FALSE) {
  if (!exists("census_summary")) {
    stop("census_summary not loaded.")
  }
  
  data <- census_summary[!is.na(census_summary$Total_Population), ]
  
  p <- ggplot(data, aes(x = Year, y = Total_Population)) +
    geom_line(color = "#2E7D32", linewidth = 1.2) +
    geom_point(color = "#1B5E20", size = 3) +
    scale_y_continuous(labels = function(x) format(x, big.mark = ",", scientific = FALSE)) +
    labs(
      title = "Kenya Population Growth (1948-2019)",
      subtitle = "Source: Kenya National Bureau of Statistics",
      x = "Census Year",
      y = "Population",
      caption = "kenyacensus R package"
    ) +
    theme_minimal() +
    theme(
      plot.title = element_text(face = "bold", size = 14),
      plot.subtitle = element_text(color = "gray40"),
      axis.text = element_text(size = 10)
    )
  
  if (log_scale) {
    p <- p + scale_y_log10(labels = function(x) format(x, big.mark = ",", scientific = FALSE))
  }
  
  return(p)
}

# Plot Population Pyramid
#
# Creates a population pyramid showing age and sex distribution.
#
# @return A ggplot object
# @export
# @examples
# plot_population_pyramid()
plot_population_pyramid <- function() {
  if (!exists("census_age_sex")) {
    stop("census_age_sex not loaded.")
  }
  
  data <- census_age_sex[census_age_sex$Age_Group != "Not Stated", ]
  
  plot_data <- data.frame(
    Age = rep(data$Age_Group, 2),
    Population = c(-data$Male, data$Female),
    Sex = rep(c("Male", "Female"), each = nrow(data))
  )
  
  age_levels <- c("0-4", "5-9", "10-14", "15-19", "20-24", "25-29", "30-34",
                  "35-39", "40-44", "45-49", "50-54", "55-59", "60-64",
                  "65-69", "70-74", "75-79", "80-84", "85-89", "90-94", "95+")
  plot_data$Age <- factor(plot_data$Age, levels = rev(age_levels))
  
  p <- ggplot(plot_data, aes(x = Age, y = Population, fill = Sex)) +
    geom_bar(stat = "identity") +
    coord_flip() +
    scale_fill_manual(values = c("Male" = "#1976D2", "Female" = "#C62828")) +
    scale_y_continuous(
      labels = function(x) format(abs(x), big.mark = ",", scientific = FALSE),
      breaks = pretty
    ) +
    labs(
      title = "Kenya Population Pyramid (2019)",
      subtitle = "Source: Kenya National Bureau of Statistics",
      x = "Age Group",
      y = "Population",
      caption = "kenyacensus R package"
    ) +
    theme_minimal() +
    theme(
      plot.title = element_text(face = "bold", size = 14),
      legend.position = "bottom"
    )
  
  return(p)
}

# Plot County Population Bar Chart
#
# Creates a horizontal bar chart of population by county.
#
# @param top_n Integer. Show top N counties by population. Default 10.
# @param fill_var Character. Variable to use for fill color. Default "Population_Density".
# @return A ggplot object
# @export
# @examples
# plot_county_map(top_n = 15)
plot_county_map <- function(top_n = 10, fill_var = "Population_Density") {
  if (!exists("census_by_county")) {
    stop("census_by_county not loaded.")
  }
  
  data <- census_by_county
  data <- data[order(data$Total, decreasing = TRUE), ]
  
  if (top_n < nrow(data)) {
    data <- data[1:top_n, ]
  }
  
  data$County <- factor(data$County, levels = rev(data$County))
  
  p <- ggplot(data, aes(x = County, y = Total, fill = .data[[fill_var]])) +
    geom_bar(stat = "identity") +
    coord_flip() +
    scale_fill_gradient(low = "#81C784", high = "#1B5E20") +
    scale_y_continuous(labels = function(x) format(x, big.mark = ",", scientific = FALSE)) +
    labs(
      title = paste("Top", top_n, "Most Populous Counties (2019)"),
      subtitle = "Source: Kenya National Bureau of Statistics",
      x = NULL,
      y = "Population",
      fill = gsub("_", " ", fill_var),
      caption = "kenyacensus R package"
    ) +
    theme_minimal() +
    theme(
      plot.title = element_text(face = "bold", size = 14),
      legend.position = "right"
    )
  
  return(p)
}

# Calculate Population Growth Rate
#
# Calculate the annual growth rate between two census years.
#
# @param year1 Earlier year
# @param year2 Later year
# @return Numeric growth rate as percentage
# @export
# @examples
# calculate_growth_rate(2009, 2019)
calculate_growth_rate <- function(year1, year2) {
  if (!exists("census_summary")) {
    stop("census_summary not loaded.")
  }
  
  d1 <- census_summary[census_summary$Year == year1, "Total_Population"]
  d2 <- census_summary[census_summary$Year == year2, "Total_Population"]
  
  if (length(d1) == 0 || length(d2) == 0) {
    stop("Data not available for one or both years.")
  }
  
  if (is.na(d1) || is.na(d2)) {
    stop("Population data missing for one or both years.")
  }
  
  years <- year2 - year1
  rate <- ((d2 / d1)^(1/years) - 1) * 100
  
  cat(sprintf("Growth rate %d-%d: %.2f%% per year\n", year1, year2, rate))
  return(invisible(rate))
}

# Compare Counties
#
# Compare multiple counties across selected variables.
#
# @param counties Character vector of county names
# @param variables Character vector of variables to compare
# @return A data frame with comparison data
# @export
# @examples
# compare_counties(c("Nairobi City", "Mombasa", "Kisumu"))
compare_counties <- function(counties, variables = c("Total", "Households", "Population_Density")) {
  data <- get_county_data(counties, c("County", variables))
  
  all_counties <- census_by_county
  for (var in variables) {
    rank_col <- paste0(var, "_Rank")
    data[[rank_col]] <- rank(-all_counties[[var]])[match(data$County, all_counties$County)]
  }
  
  return(data)
}

# Search Counties
#
# Search for counties by name pattern.
#
# @param pattern Character string to search for
# @param ignore_case Logical. Default TRUE.
# @return Character vector of matching county names
# @export
# @examples
# search_counties("Nai")
# search_counties("Kis")
search_counties <- function(pattern, ignore_case = TRUE) {
  if (!exists("census_by_county")) {
    stop("census_by_county not loaded.")
  }
  
  matches <- grep(pattern, census_by_county$County, ignore.case = ignore_case, value = TRUE)
  
  if (length(matches) == 0) {
    message("No counties found matching '", pattern, "'")
  } else {
    message("Found ", length(matches), " match(es):")
    print(matches)
  }
  
  return(invisible(matches))
}