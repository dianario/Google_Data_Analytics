-- Simple calculations SQL example
SELECT 
Date,
Region,
Small_Bags, 
Large_Bags,
XLarge_Bags,
Total_Bags,
Small_Bags + Large_Bags + XLarge_Bags AS Sum_Bags
FROM 
`data-analytics-proj-13-07-2023.avocado_data.avocado_prices` 


-- Division while avoiding error when denominator is 0
SELECT 
  Date, 
  Region, 
  Total_Bags, 
  Small_Bags,
  (Small_Bags/Total_Bags)*100 AS Small_Bags_Percent
FROM 
`data-analytics-proj-13-07-2023.avocado_data.avocado_prices`
WHERE 
Total_Bags <> 0



-- Extract function: pulling one part of a given date field
-- this query extracts the year of ride, then counts the number of rides in 
-- a given year
SELECT 
  EXTRACT(YEAR FROM starttime) AS year, 
  COUNT (*) AS number_of_rides
FROM 
  `bigquery-public-data.new_york_citibike.citibike_trips` 
GROUP BY
  year
ORDER BY
year DESC


-- Create a temp table to do multiple operations on then count trips
WITH trips_over_1_hr AS (
  SELECT  
    *
  FROM 
    `bigquery-public-data.new_york_citibike.citibike_trips` 
  WHERE
  tripduration >= 60
)
--Count how many trips are 60+ min long
SELECT
COUNT(*) AS cnt
FROM trips_over_1_hr

--AUSTIN_BIKESHARE excercise
-- find station with the longest ride duration from austin_bikeshare
-- without a temp file but with subquery
SELECT
  start_station_name,
  duration_minutes,
FROM `bigquery-public-data.austin_bikeshare.bikeshare_trips` 
WHERE 
 duration_minutes = 
 (SELECT 
    max(duration_minutes) 
  FROM 
  `bigquery-public-data.austin_bikeshare.bikeshare_trips`);


-- determine which bike has been used the most
-- find out at which station the bike is most likely found

--1st determine which bike has been used the most with a temp table
WITH longest_used_bike AS (
  SELECT
    bike_id, 
    SUM(duration_minutes) AS tot_trip_duration
  FROM `bigquery-public-data.austin_bikeshare.bikeshare_trips`
  GROUP BY 
    bike_id
  ORDER BY
    tot_trip_duration DESC
  LIMIT 1)
-- find station at which longest bikeshare ride is most likely to have started
-- aka find at what is the name of the station that has the most starts for that bike
SELECT 
  trips.start_station_id,
  trips.start_station_name,
  COUNT (*) AS trips_count,
  trips.bike_id 
FROM 
  longest_used_bike as longest
FULL JOIN 
  `bigquery-public-data.austin_bikeshare.bikeshare_trips` AS trips 
  ON longest.bike_id = trips.bike_id 
GROUP BY 
  trips.start_station_id, trips.start_station_name, trips.bike_id 
ORDER BY 
  trips_count DESC
LIMIT 1
