pacman::p_load(tsibble, dplyr, feasts, fable, readr)

# loads data from CSV
tfr_data <- read_csv("data/BirthsAndFertilityRatesAnnual.csv")

# transposes data such that 
tfr_data <- t(tfr_data)
