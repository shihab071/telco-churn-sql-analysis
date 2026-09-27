WITH customer_risk AS (
    SELECT
        customer_id,
        churn,
        CASE
            WHEN contract = 'Month-to-month'
                 AND internet_service = 'Fiber optic'
                 AND tech_support = 'No'
                THEN 'High risk'
            WHEN contract = 'Month-to-month'
                THEN 'Medium risk'
            ELSE 'Low risk'
        END AS risk_segment
    FROM telco_customers_raw
)
select  risk_segment,
        count(*) as total_customers,
        sum(case when churn = 'Yes' then 1 else 0 end)
        as churned_customers,
        round((sum(case when churn = 'Yes' then 1 else 0 end)
        * 100.0)/count(*),2) 
        as churn_rate_percent
from customer_risk
GROUP BY risk_segment
order by churn_rate_percent desc;