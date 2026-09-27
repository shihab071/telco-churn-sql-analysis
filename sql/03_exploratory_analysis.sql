-- Calculate the overall customer churn rate

select 
    count(*) as total_customers,
    sum(case when churn = 'Yes' then 1 else 0 end)
    as churned_customers,
    round((sum(case when churn = 'Yes' then 1 else 0 end)
     * 100.0)/count(*),2) 
    as churn_rate_percent
from telco_customers_raw;

select 
    contract,
    count(*) as total_customers,
    sum(case when churn = 'Yes' then 1 else 0 end)
    as churned_customers,
    round((sum(case when churn = 'Yes' then 1 else 0 end)
     * 100.0)/count(*),2) 
    as churn_rate_percent
from telco_customers_raw
group by contract
order by churn_rate_percent desc;


select  (case
        when (tenure::integer) <= 12 then '1. 0-12 months'
        when (tenure::integer)  <= 24 then '2. 13-24 months'
        when (tenure::integer)  <= 48 then '3. 25-48 months'
        else '4. 49-72 months'
        end) as tenure_group,
        count(*) as total_customers,
        sum(case when churn = 'Yes' then 1 else 0 end)
        as churned_customers,
        round((sum(case when churn = 'Yes' then 1 else 0 end)
        * 100.0)/count(*),2) 
        as churn_rate_percent
        
from telco_customers_raw 
group by tenure_group
order by tenure_group;

select internet_service,
        count(*) as total_customers,
        sum(case when churn = 'Yes' then 1 else 0 end)
        as churned_customers,
        round((sum(case when churn = 'Yes' then 1 else 0 end)
        * 100.0)/count(*),2) 
        as churn_rate_percent
from telco_customers_raw
group by internet_service
order by churn_rate_percent desc;

select  payment_method,
        count(*) as total_customers,
        sum(case when churn = 'Yes' then 1 else 0 end)
        as churned_customers,
        round((sum(case when churn = 'Yes' then 1 else 0 end)
        * 100.0)/count(*),2) 
        as churn_rate_percent
from telco_customers_raw
group by payment_method
order by churn_rate_percent desc;

select  churn,
        count(*) as total_customers,
        round(avg(monthly_charges::numeric),2) as average_monthly_charges,
        round(avg(NULLIF(TRIM(total_charges), '')::numeric),2) 
        as average_total_charges

from telco_customers_raw
group by churn
order by churn;