library(tidyverse)
library(skimr)
library(janitor)
bookings_df <- read_csv("hotel_bookings.csv")

head(bookings_df)
str(bookings_df)
glimpse(bookings_df)
colnames(bookings_df)
skim_without_charts(bookings_df)

trimmed_df <- bookings_df %>% 
  select(hotel,is_canceled, lead_time) %>% 
  rename(hotel_type = hotel)
head(trimmed_df)

# Combined to columns into one
example_df <- bookings_df %>%
  select(arrival_date_year, arrival_date_month) %>% 
  unite(arrival_month_year, c("arrival_date_month", "arrival_date_year"), 
        sep = " ")
head(example_df)

#create a new column
guests_df <- bookings_df %>% 
  mutate(guests = adults + children + babies) %>% 
  select(guests)
head(guests_df)

# Calculate the total number of canceled bookings and the average lead time for 
# booking

example_df <- bookings_df %>% 
  summarise(tot_cancelled_bookings = sum(is_canceled), 
            mean_lead_time = mean (lead_time))
head(example_df)