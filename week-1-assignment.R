# Assignment 1
# OMSBA 5112: Stats For Business
# Shreeya Sampat

# Calling the libraries needed
library(tidyverse)
library(haven)

# Reads the entire sample into the nfhs dataframe
nfhs <- read_dta("IAHR52FL.dta")

# Plotting a histogram of the listed household members
#Also labeling the x as Number of Household Members.
ggplot(data = nfhs) + 
  geom_histogram(mapping = aes(x = hv009), binwidth = 1) +
  xlab("Number Of Household Members")

# New dataframe that only contains urban households
urban <- nfhs %>%
  filter(hv025 == 1)

# Created a boxplot using the urban households.
# Also used factor() in x to distinguish that it is a categorical variable.
ggplot(data = urban) +
  geom_boxplot(mapping = aes(x = factor(hv026), y = hv009)) + 
  labs(x = "Type Of Urban Area", y = "Number of Household Members") +
  scale_x_discrete(labels = c('Large City', 'Small City', 'Town'))

# Using "group_by" and "summarise" to find means and medians
# for the urban households
# Used %>% operator to group 
urban %>%
  group_by(hv026) %>% 
  summarise(
    mean_hh = mean(hv009),
    median_hh = median(hv009)
  )
