install.packages("tidyverse")
library(tidyverse)

# This allows to read the package documentation
browseVignettes("tidyverse")
browseVignettes("ggplot2")

# Demonstration of using pipes
#
#
data("ToothGrowth")
View(ToothGrowth)
library(dplyr)

#Filter data based on vitc dosage
filtered_tg <- filter(ToothGrowth, dose == 0.5)
View(filtered_tg)
#sort data based on tooth length
arrange(filtered_tg, len)

# nested function combining filtering and sorting
arrange(filter(ToothGrowth, dose == 0.5), len)

#Usage of pipes
# use ctrl + shift + m for shortcut
filtered_toothgrowth <- ToothGrowth %>% 
  filter(dose == 0.5) %>% 
  group_by(supp) %>% 
  arrange(len) %>% 
  summarize(mean_len = mean (len, na.rm = TRUE))
View(filtered_toothgrowth)
