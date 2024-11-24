-- CHECK FOR NULL VALUES
SELECT *
FROM [project2].[dbo].['credit_data origi (1)$']
WHERE [saving acc] is NULL
AND [checking acc] is NULL



-- DELETE WHERE THEY ARE NULL VALUES // [project2].[dbo].['credit_data origi (1)$']
DELETE 
FROM [project2].[dbo].['credit_data origi (1)$']
WHERE [saving acc] is NULL
AND [checking acc] is NULL


    
-- CHECK FOR ACCOMMODATION NUMBER
SELECT housing, COUNT(customer_id) as num_accommodation
FROM [project2].[dbo].['credit_data origi (1)$']
GROUP BY housing;



-- CHECK FOR EMPLOY, UNEMPLOYED, 
SELECT job, COUNT(customer_id) as customer_count
FROM [project2].[dbo].['credit_data origi (1)$']
GROUP BY job



--CHECK FOR CUSTOMERS' LOAN PURPOSES
SELECT [loan purpose],
COUNT(customer_id)
FROM [project2].[dbo].['credit_data origi (1)$']
GROUP BY [loan purpose]


-- CHECK FOR age-range
WITH categorized_ages AS (
    SELECT age,
        CASE
            WHEN age >= 0 AND age < 18 THEN '0-14'
            WHEN age >= 18 AND age < 30 THEN '18-30'
            WHEN age >= 30 AND age < 40 THEN '30-40'
            WHEN age >= 40 AND age < 50 THEN '40-50'
            WHEN age >= 50 AND age < 60 THEN '50-60'
            ELSE '65+'
        END AS age_group
    FROM [project2].[dbo].['credit_data origi (1)$']
)
SELECT age_group, COUNT(*) AS total_people
FROM categorized_ages
GROUP BY age_group;
