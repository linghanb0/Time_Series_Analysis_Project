pacman::p_load(tsibble, dplyr, feasts, fable, readr)

# loads data from CSV
birth_data <- read_csv("data/BirthsAndFertilityRatesAnnual.csv")

# transposes data such that it is appropriate for required analysis
birth_data <- t(birth_data)

# extracts the list of years to add back into the data later
years <- as.integer(rownames(birth_data)[-1])

# formats the data by:
# 1. extracting the total fertility rate and total live births
# 2. associates a year with each datapoint
# 3. ensures that all data is numeric, rather than saved as a string
birth_data <- as_tibble(birth_data) %>%
  setNames(.[1, ]) %>%
  slice(-1) %>%
  select(tfr = "Total Fertility Rate (TFR)", tlb = "Total Live-Births") %>%
  mutate(year = years, tfr = as.numeric(tfr), tlb = as.numeric(tlb)) %>%
  as_tsibble(index = year)

# visualises relationship between tfr and time
birth_data %>% autoplot(.vars = tfr)

# visualises relationship between tlb and time
birth_data %>% autoplot(.vars = tlb)


  

