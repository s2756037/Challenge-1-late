# layout: Challenge 1
# title: Where are the red squirrels?
# student #: s2756037
# date: 17/10/24

# 1. DATA MANIPULATION

# Load necessary libraries
library(dplyr)
library(tidyr)

# Assume squirrel_data is your original dataset
squirrel_data <- read.csv("Data/squirrels.csv")

# Create dataframe that only includes Common name, year, and individual count
cleaned_data <- squirrel_data %>%
  select(Common.name, Start.date.year, Individual.count)

# Filter observations for years 2008 to 2017 and rename column
cleaned_data <- cleaned_data %>%
  filter(Start.date.year >= 2008 & Start.date.year <= 2017) %>%
  rename(year = Start.date.year)

# Create a species column with Red and Grey squirrels as factor levels
cleaned_data <- cleaned_data %>%
  filter(Common.name == c('Red Squirrel', 'Grey Squirrel')) %>%
  rename(species = Common.name)

# Replace NA values in Individual.count column with 1
cleaned_data <- cleaned_data %>%
  mutate(Individual.count = ifelse(is.na(Individual.count), 1, Individual.count)) 

# View cleaned data
print(cleaned_data)

# Get the size of the cleaned dataset
dataset_size <- nrow(cleaned_data)
dataset_size
# The size of the dataset is 17890 objects

# Round the dataset size to the nearest thousand
rounded_size <- round(dataset_size / 1000) * 1000
rounded_size
# The rounded size of the dataset is 18000 objects

# 2. TEMPORAL TRENDS

# Summarize the number of observations per species and year
squirrel_summary <- cleaned_data %>%
  group_by(species, year) %>%
  summarise(total_observations = sum(Individual.count, na.rm = TRUE), .groups = 'drop')

# View the summary table
head(squirrel_summary)

# Load ggplot2 for plotting
library(ggplot2)

# Plot the temporal trends of squirrel populations by species
ggplot(squirrel_summary, aes(x = year, y = total_observations, color = species)) +
  geom_line() +
  geom_point() +
  labs(title = "Temporal Trends in Squirrel Populations (2008-2017)",
       x = "Year",  
       y = "Total Observations", 
       color = "Species") +
  theme_minimal()

# Fit a linear regression model with interaction between year and species
model <- lm(total_observations ~ year * species, data = squirrel_summary)
# year represents a numeric variable representing the year (2008-2017), species represents a factor variable with two levels: "Red Squirrel" and "Grey Squirrel",
# and year * species is an interaction term to test if the temporal trend differs for red and grey squirrels.

# View the model summary
summary(model)

# Get adjusted R-squared from the model summary
adjusted_r_squared <- summary(model)$adj.r.squared
adjusted_r_squared
# Adjusted R-squared value is 0.4588178