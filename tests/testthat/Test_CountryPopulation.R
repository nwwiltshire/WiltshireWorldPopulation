library(testthat)

test_that("CountryPopulation works for valid country names", {
  expect_silent(CountryPopulation("Bahamas"))
})

test_that("CountryPopulation returns an error for invalid country names", {
  expect_error(CountryPopulation("Invalid___Country"))
})

