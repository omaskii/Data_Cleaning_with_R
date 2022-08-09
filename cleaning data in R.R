#Claning Data

install.packages("tidyverse")
install.packages("skimr")
install.packages("janitor")

library(tidyverse)
library(skimr)
library(janitor)

#Explore the data
bookings_df <- read_csv("hotel_bookings.csv")
head(bookings_df)
str(bookings_df)
glimpse(bookings_df)
colnames(bookings_df)
skim_without_charts(bookings_df)

#Clean data
#to create data frame with only 'hotel', 'is_canceled', and 'lead_time'
trimmed_df <- bookings_df %>% 
  select( hotel, is_canceled, lead_time)

#rename hotel to hotel_type
trimmed_df %>% 
  select(hotel, is_canceled, lead_time) %>% 
  rename( hotel_type = hotel)

#combine the arrival month and year into one column using the unite() function
example_df <- bookings_df %>%
  select(arrival_date_year, arrival_date_month) %>% 
  unite(arrival_month_year, c("arrival_date_month", "arrival_date_year"), sep = " ")

#create a new column that summed up all the adults, children, and babies on a reservation 
#for the total number of people
example_df <- bookings_df %>%
  mutate(guests = adults + children + babies)
head(example_df)

#Excercise Calculate the total number of canceled bookings and the average lead time for booking - 
#you'll want to start your code after the %>% symbol. Make a column called 'number_canceled' to represent
#the total number of canceled bookings. Then, make a column called 'average_lead_time' to represent the average lead time

example_df <- bookings_df %>% summarize(number_canceled = sum(is_canceled), average_lead_time = mean(lead_time))
head(example_df)
