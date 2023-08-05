
library(dplyr)


data <- read.csv("cities.csv")
View(data)

stateWithoutClinic <- data %>%
  filter(gestation_8_duration > 0)
View(stateWithoutClinic)
CitiesWithoutClinicAccessIn8hrs <- nrow(stateWithoutClinic)

totalPeople <- sum(stateWithoutClinic$population)

longestDriveforCitiesIf8 <- max(stateWithoutClinic$gestation_8_duration)

CitiesWithLongestDrive <- stateWithoutClinic <- data %>%
  filter(gestation_8_duration == longestDriveforCitiesIf8)
