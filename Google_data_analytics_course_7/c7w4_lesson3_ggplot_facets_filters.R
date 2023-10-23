library(tidyverse)
hotel_bookings <- read.csv("hotel_bookings.csv")
head(hotel_bookings)
colnames(hotel_bookings)
str(hotel_bookings)
ggplot(data=hotel_bookings) + 
  geom_bar(mapping=aes(x=distribution_channel, fill=deposit_type))

ggplot(data=hotel_bookings) + 
  geom_bar(mapping=aes(x=distribution_channel, fill=market_segment))

# hotel bookings stratified by distribution channel, empty plots show
ggplot(data = hotel_bookings) +
  geom_bar(mapping = aes(x = distribution_channel)) +
  facet_wrap(~deposit_type)+
  theme(axis.text.x = element_text(angle = 45))

# hotel bookings stratified by d, empty plots show
ggplot(data = hotel_bookings) +
  geom_bar(mapping = aes(x = distribution_channel)) +
  facet_wrap(~market_segment) +
  theme(axis.text.x = element_text(angle = 45))

# hotel bookings stratified by deposit type, empty plots show
ggplot(data = hotel_bookings) +
  geom_bar(mapping = aes(x = distribution_channel)) +
  facet_grid(~deposit_type) +
  theme(axis.text.x = element_text(angle = 45))

# hotel bookings stratified by deposit type and market segment
ggplot(data = hotel_bookings) +
  geom_bar(mapping = aes(x = distribution_channel)) +
  facet_wrap(~deposit_type~market_segment) +
  theme(axis.text.x = element_text(angle = 45))

# booking lead time for guests travelling with children
ggplot(data = hotel_bookings) +
  geom_point(mapping = aes(x = lead_time, y = children))
