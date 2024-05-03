library(tidyverse)
library(readxl)


WorldPopulation <- read_excel("data-raw/World_Population.xlsx", sheet = "ESTIMATES", skip = 16) %>%
  filter(Type == "Country/Area") %>%
  select(`Region, subregion, country or area *`, `1950`:`2020`)

names(WorldPopulation)[names(WorldPopulation) == "Region, subregion, country or area *"] <- "Country_Name"

usethis::use_data(WorldPopulation)


