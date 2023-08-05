library(dplyr)
library(knitr)

clinics <- read.csv("https://raw.githubusercontent.com/the-pudding/data/master/clinics/cities.csv", stringsAsFactors = FALSE)

agg_table <- clinics %>% 
  select(state, city, gestation_12_duration) %>% 
  arrange(-gestation_12_duration) %>% 
  slice_head(n=20)

colnames(agg_table) <- c("State", "City", "Driving Time at 12 Weeks, hours")
kable(agg_table)
