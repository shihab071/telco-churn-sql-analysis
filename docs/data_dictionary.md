# Data Dictionary

## Dataset overview

The Telco Customer Churn dataset contains 7,043 customer records and 21 columns. It includes customer demographics, subscribed services, contract information, charges and churn status.

The PostgreSQL raw-data table is named `telco_customers_raw`.

## Columns

| Column | Raw type | Description |
|---|---|---|
| `customer_id` | TEXT | Unique identifier assigned to each customer |
| `gender` | TEXT | Customer gender |
| `senior_citizen` | TEXT | Indicates whether the customer is a senior citizen: `1` for yes and `0` for no |
| `partner` | TEXT | Indicates whether the customer has a partner |
| `dependents` | TEXT | Indicates whether the customer has dependents |
| `tenure` | TEXT | Number of months the customer has remained with the company |
| `phone_service` | TEXT | Indicates whether the customer has phone service |
| `multiple_lines` | TEXT | Indicates whether the customer has multiple telephone lines |
| `internet_service` | TEXT | Customer’s internet-service type: DSL, fiber optic or no internet service |
| `online_security` | TEXT | Indicates whether the customer has online-security service |
| `online_backup` | TEXT | Indicates whether the customer has online-backup service |
| `device_protection` | TEXT | Indicates whether the customer has device-protection service |
| `tech_support` | TEXT | Indicates whether the customer has technical-support service |
| `streaming_tv` | TEXT | Indicates whether the customer has streaming-TV service |
| `streaming_movies` | TEXT | Indicates whether the customer has streaming-movie service |
| `contract` | TEXT | Customer contract type: month-to-month, one year or two year |
| `paperless_billing` | TEXT | Indicates whether the customer uses paperless billing |
| `payment_method` | TEXT | Method used by the customer to make payments |
| `monthly_charges` | TEXT | Amount charged to the customer each month |
| `total_charges` | TEXT | Total amount charged during the customer relationship |
| `churn` | TEXT | Indicates whether the customer left the company |

## Data-quality notes

- The dataset contains 7,043 customer records.
- Every `customer_id` is unique.
- No duplicate customer IDs were found.
- Eleven customers have blank `total_charges` values.
- All eleven affected customers have zero months of tenure.
- The blank `total_charges` values therefore represent new customers who have not accumulated charges.
- Numeric fields were initially stored as text in the raw table to preserve the original imported data.
- Numeric conversion was performed during analysis with PostgreSQL casting.
- Blank `total_charges` values were converted to `NULL` during calculations using `NULLIF()`.

## Analysis conversions

| Raw column | Analysis type | Conversion |
|---|---|---|
| `senior_citizen` | INTEGER | `senior_citizen::INTEGER` |
| `tenure` | INTEGER | `tenure::INTEGER` |
| `monthly_charges` | NUMERIC | `monthly_charges::NUMERIC` |
| `total_charges` | NUMERIC | `NULLIF(TRIM(total_charges), '')::NUMERIC` |