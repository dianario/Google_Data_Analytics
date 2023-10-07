--count num of rows to delete (compression_ratio out of range)
SELECT 
COUNT (compression_ratio) AS num_rows_to_delete 
FROM 
`data-analytics-proj-13-07-2023.cars.car_info`
WHERE 
compression_ratio = 70;

SELECT
DISTINCT drive_wheels
FROM
`data-analytics-proj-13-07-2023.cars.car_info`;


-- test if all drive_wheels have lenght 3
SELECT 
DISTINCT LENGTH(drive_wheels) AS drive_wheels_len
FROM `data-analytics-proj-13-07-2023.cars.car_info`;

-- drive_wheels lenght test on coursera
SELECT 
DISTINCT drive_wheels,
LENGTH(drive_wheels) AS drive_wheels_string_len
FROM 
`data-analytics-proj-13-07-2023.cars.car_info`

-- TRIM drive_wheels col in db
UPDATE  `data-analytics-proj-13-07-2023.cars.car_info`
SET drive_wheels = TRIM(drive_wheels)
WHERE TRUE; 

--check trim issue is resolved
SELECT 
DISTINCT drive_wheels
FROM 
 `data-analytics-proj-13-07-2023.cars.car_info`;

--example sorting in SQL
SELECT 
purchase_price
FROM 
`data-analytics-proj-13-07-2023.customer_data.customer_purchase`
ORDER BY
purchase_price DESC

--casting data as a different type
SELECT 
CAST(purchase_price AS FLOAT64)
FROM 
`data-analytics-proj-13-07-2023.customer_data.customer_purchase`
ORDER BY
CAST(purchase_price AS FLOAT64) DESC

-- cast another example
SELECT 
CAST (date AS date) AS date_only,
purchase_price
FROM 
`data-analytics-proj-13-07-2023.customer_data.customer_purchase`
WHERE
date BETWEEN '2020-12-01' AND '2020-12-31'

-- create new keys by concat
SELECT 
CONCAT (product_code, product_color) AS new_product_code
FROM 
`data-analytics-proj-13-07-2023.customer_data.customer_purchase`
WHERE
product ='couch'

-- coalesce function - checks 1st col for data and then second if there are no data in first
--returns non null vals
SELECT 
COALESCE(product, product_code) AS product_info
FROM 
`data-analytics-proj-13-07-2023.customer_data.customer_purchase`