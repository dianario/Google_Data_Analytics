install.packages("palmerpenguins")
library(palmerpenguins)
library(tidyverse)

# Cleaning data
install.packages("here")
library(here)
install.packages("skimr")
library(skimr)
install.packages("janitor")
library(janitor)


skim_without_charts(penguins)
head(penguins)
penguins %>% select(-species)

# rename column
penguins %>%rename(island_new = island)

# change column names to be consistent.
# clean_names: gaps are changed to _; no special symbols, all lower case
rename_with(penguins, tolower)
clean_names(penguins)

# Organising data
# arrange()
penguins %>%  arrange(bill_length_mm)

penguins2 <- penguins %>%  arrange(bill_length_mm)
View(penguins2)

# group
penguins %>% group_by(island) %>% drop_na() %>% 
  summarise(mean_bill_lenght_mm = mean(bill_length_mm))

penguins %>% group_by(island) %>% drop_na() %>% 
  summarise(max_bill_lenght_mm = max(bill_length_mm))

penguins %>% group_by(species, island) %>%  drop_na() %>%  
  summarise(max_bl = max(bill_length_mm), mean_bl = mean(bill_length_mm))

# filter
penguins %>%  filter(species == "Adelie") 
