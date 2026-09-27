-- Analyze churn by contract and internet-service segment
select  contract,
        internet_service,
        count(*) as total_customers,
        sum(case when churn = 'Yes' then 1 else 0 end)
        as churned_customers,
        round((sum(case when churn = 'Yes' then 1 else 0 end)
        * 100.0)/count(*),2) 
        as churn_rate_percent
from    telco_customers_raw
group by contract, internet_service
order by churn_rate_percent desc;

select  tech_support,
        count(*) as total_customers,
        sum(case when churn = 'Yes' then 1 else 0 end)
        as churned_customers,
        round((sum(case when churn = 'Yes' then 1 else 0 end)
        * 100.0)/count(*),2) 
        as churn_rate_percent
from    telco_customers_raw
where   contract = 'Month-to-month' and
        internet_service = 'Fiber optic'
group by tech_support
order by churn_rate_percent desc;

SELECT (
    CASE
        WHEN contract = 'Month-to-month'
             AND internet_service = 'Fiber optic'
             AND tech_support = 'No'
            THEN 'High risk'
        WHEN contract = 'Month-to-month'
            THEN 'Medium risk'
        ELSE 'Low risk'
    END) AS risk_segment,
    count(*) as total_customers,
        sum(case when churn = 'Yes' then 1 else 0 end)
        as churned_customers,
        round((sum(case when churn = 'Yes' then 1 else 0 end)
        * 100.0)/count(*),2) 
        as churn_rate_percent
FROM telco_customers_raw
group by risk_segment
ORDER BY churn_rate_percent desc;
