my_data <- read.csv("cities.csv")

# Load necessary libraries
install.packages("ggplot2")  # Install ggplot2 if you haven't already
library(ggplot2)

# Assuming your data is named 'my_data'
# Create a new data frame to store the gestation durations for each city
gestation_data <- data.frame(
  city = my_data$city,
  gestation_8_duration = my_data$gestation_8_duration,
  gestation_12_duration = my_data$gestation_12_duration,
  gestation_16_duration = my_data$gestation_16_duration,
  gestation_20_duration = my_data$gestation_20_duration
)

# Convert the data to long format for ggplot
library(tidyr)
gestation_data_long <- pivot_longer(gestation_data,
                                    cols = starts_with("gestation"),
                                    names_to = "gestation_period",
                                    values_to = "duration")

# Select a random subset of cities (e.g., 10 cities)
library(dplyr)
set.seed(123)  # Set seed for reproducibility
selected_cities <- sample(unique(gestation_data_long$city), 10)

# Filter the data to include only the selected cities
gestation_data_subset <- filter(gestation_data_long, city %in% selected_cities)

# Create the bar chart
chart3 <- ggplot(data = gestation_data_subset, aes(x = city, y = duration, fill = gestation_period)) +
  geom_bar(stat = "identity", position = "dodge", width = 0.7) +
  labs(title = "Gestation Durations for Selected Cities",
       x = "City",
       y = "Duration",
       fill = "Gestation Period") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# Print the chart
print(chart3)



