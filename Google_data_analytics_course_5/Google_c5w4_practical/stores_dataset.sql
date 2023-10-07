-- find out range of sales to analyse
SELECT 
MIN(Date) AS min_date,
MAX(Date) AS max_date
FROM `data-analytics-proj-13-07-2023.store_dataset.sales_info`

-- quantity sold for each ProductID by the month and year it was sold
SELECT
  EXTRACT (YEAR FROM Date) AS Year,
  EXTRACT (MONTH FROM Date) AS Month,
  ProductId, 
  SUM(Quantity) AS UnitsSold
FROM 
  `data-analytics-proj-13-07-2023.store_dataset.sales_info`
GROUP BY
  Year, 
  Month, 
  ProductId
ORDER BY 
   Year, 
   Month, 
   ProductId
   