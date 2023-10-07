-- 
--
--left join example
--
-- in this example data is joined based on department ID. All rows from employees
-- are included in the output, regardless of whether the deparment ID exists in the
-- departments table. If it exists it matches the data, otherwise it returns null for the col
--name
SELECT 
    employees.name AS employee_name,
    employees.role AS employee_role,
    departments.name AS department_name
FROM 
`data-analytics-proj-13-07-2023.employee_data.employees` AS employees
LEFT JOIN 
`data-analytics-proj-13-07-2023.employee_data.departments` AS departments
ON employees.department_id = departments.department_id


--
--
-- inner join example
--
-- in this example data is joined based on department ID. Only rows for which deparment ID val
-- exists in both tables are joined
SELECT 
    employees.name AS employee_name,
    employees.role AS employee_role,
    departments.name AS department_name
FROM 
`data-analytics-proj-13-07-2023.employee_data.employees` AS employees
INNER JOIN 
`data-analytics-proj-13-07-2023.employee_data.departments` AS departments
ON employees.department_id = departments.department_id

-- Inner join example 2
SELECT 
    edu.country_name,
    summary.country_code,
    edu.value
FROM 
    bigquery-public-data.world_bank_intl_education.international_education AS edu
INNER JOIN 
    bigquery-public-data.world_bank_intl_education.country_summary AS summary
ON edu.country_code = summary.country_code

-- inner join example 3
SELECT 
    AVG(edu.value) average_value, summary.region
FROM 
    `bigquery-public-data.world_bank_intl_education.international_education` AS edu
INNER JOIN 
    `bigquery-public-data.world_bank_intl_education.country_summary` AS summary
ON edu.country_code = summary.country_code
WHERE summary.region IS NOT null
GROUP BY summary.region
ORDER BY average_value DESC

--Subquery example
-- this query orders 
SELECT
  id,
  name,
  number_of_rides AS number_of_rides_starting_station
FROM
  (
    SELECT
      start_station_id,
      COUNT(*) number_of_rides
    FROM
      bigquery-public-data.london_bicycles.cycle_hire
    GROUP BY
      start_station_id
  )
  AS station_num_trips
  INNER JOIN
  bigquery-public-data.london_bicycles.cycle_stations ON id = start_station_id
  ORDER BY
    number_of_rides DESC

