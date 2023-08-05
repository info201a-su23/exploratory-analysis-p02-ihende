
library(ggplot2)
library(tidyverse)
library(tidyr)
library(dplyr)


data <- read.csv("cities.csv")

dataCompare <- data %>%
  filter(state == "Alabama") %>%
  select(city, gestation_8_duration, gestation_12_duration, gestation_16_duration, gestation_20_duration) %>%
  gather (key = Weeks, value = Duration , -city)

alabamaGraph <- ggplot(dataCompare) +
  geom_col(
    mapping = aes(x = city, y = Duration, fill = Weeks), position = "dodge"
  )

