library (ggplot2)

data <- read.csv("cities.csv")

max_value <- max(data$gestation_8_duration)

max_value

max_value_function <- function(){
  
  i <- max(data$gestation_8_duration)
  
  return (i)
}
my_plot <-ggplot(data) +
  geom_point(aes(x= gestation_8_duration, y = state))

my_plot
