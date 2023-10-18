install.packages("tidyverse")
library(tidyverse)
data("diamonds")

# Ways of overviewing data
View(diamonds)
head(diamonds)
str(diamonds)
colnames(diamonds)
glimpse(diamonds)

#Change dataset by adding a new col
mutate(diamonds, carat_2 = carat*100)
