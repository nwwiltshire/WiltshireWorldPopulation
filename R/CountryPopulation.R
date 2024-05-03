#' Plot Population Over Time for a Given Country
#'
#' This function takes a country name as input and returns a line plot of the population over time for that country.
#' The data is extracted from the WorldPopulation dataset.
#'
#' @param country_name A character string specifying the name of the country.
#'
#' @return A ggplot object showing the population over time for the specified country.
#'
#' @examples
#' \dontrun{
#' CountryPopulation("United States")
#' }
#'
#' @export
#'
#' @importFrom dplyr filter mutate
#' @importFrom tidyr gather
#' @importFrom ggplot2 ggplot aes geom_line labs theme_minimal ggtitle
CountryPopulation <- function(country_name) {
  if (!(country_name %in% WorldPopulation$Country_Name)) {
    stop("Error: The provided country name does not exist in the WorldPopulation data.")
  }

  WorldPopulation_long <- WorldPopulation %>%
    gather(key = "Year", value = "Population", `1950`:`2020`) %>%
    mutate(Year = as.numeric(Year), Population = as.numeric(Population))

  data_to_plot <- WorldPopulation_long %>%
    filter(Country_Name == country_name)

  p <- ggplot(data_to_plot, aes(x = Year, y = Population)) +
    geom_line() +
    labs(x = "Year", y = "Population") +
    theme_minimal() +
    ggtitle(paste(country_name))

  return(p)
}
