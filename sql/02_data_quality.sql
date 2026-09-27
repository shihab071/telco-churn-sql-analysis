-- Check the total number of customers
SELECT COUNT(*) AS total_customers
FROM telco_customers_raw;

-- Count customers by churn status
SELECT
    churn,
    COUNT(*) AS customer_count
FROM telco_customers_raw
GROUP BY churn
ORDER BY churn;

-- Check missing TotalCharges values
SELECT COUNT(*) AS missing_total_charges
FROM telco_customers_raw
WHERE TRIM(total_charges) = '';

-- Investigate customers with missing TotalCharges


select  customer_id, 
        tenure,
        monthly_charges,
        total_charges,
        contract,
        churn
from    telco_customers_raw
where trim(total_charges) = ''; 


select customer_id, count(customer_id) 
from telco_customers_raw
group by customer_id
having count(customer_id) > 1;

select  min(cast(tenure as int)) as minimum_tenure, 
        max(cast(tenure as int)) as maximum_tenure
from telco_customers_raw;


select  min(monthly_charges::numeric) as minimum_monthly_charges,
        max(monthly_charges::numeric) as maximum_monthly_charges,
        round(avg(monthly_charges::numeric), 2) as average_monthly_charges
from    telco_customers_raw;


SELECT
    MIN(NULLIF(TRIM(total_charges), '')::NUMERIC) AS minimum_total_charges,
    MAX(NULLIF(TRIM(total_charges), '')::NUMERIC) AS maximum_total_charges,
    ROUND(AVG(NULLIF(TRIM(total_charges), '')::NUMERIC), 2) AS average_total_charges
FROM telco_customers_raw;



