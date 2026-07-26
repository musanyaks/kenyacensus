context("kenyacensus package")

test_that("datasets load correctly", {
  expect_true(exists("census_summary"))
  expect_true(exists("census_by_county"))
  expect_equal(nrow(census_by_county), 47)
  expect_equal(ncol(census_summary), 6)
})

test_that("county data function works", {
  nairobi <- get_county_data("Nairobi City")
  expect_equal(nrow(nairobi), 1)
  expect_equal(nairobi$County, "Nairobi City")
})

test_that("census year function works", {
  y2019 <- get_census_year(2019)
  expect_equal(nrow(y2019), 1)
  expect_equal(y2019$Year, 2019)
})