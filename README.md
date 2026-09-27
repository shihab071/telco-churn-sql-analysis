# Telco Customer Churn Analysis with PostgreSQL

## Project overview

Customer churn is a major business challenge for subscription-based companies. This project uses PostgreSQL to analyze a real-world telecom customer dataset and identify customer groups associated with a higher risk of churn.

The analysis covers data validation, exploratory analysis, customer segmentation and a final business report built with a Common Table Expression (CTE).

## Business objective

The main objective is to answer:

> Which types of telecom customers are most likely to churn, and what actions could improve customer retention?

The analysis investigates the relationship between churn and:

- Contract type
- Customer tenure
- Internet service
- Technical support
- Payment method
- Monthly and total charges

## Dataset

The project uses the Telco Customer Churn dataset, which contains:

- 7,043 customer records
- 21 columns
- Customer demographics
- Subscribed services
- Contract and payment information
- Monthly and total charges
- Customer churn status

See the complete [data dictionary](docs/data_dictionary.md).

## Tools and SQL concepts

### Tools

- PostgreSQL 18
- `psql`
- SQL
- VS Code
- Git and GitHub

### SQL concepts demonstrated

- `SELECT`
- `WHERE`
- `GROUP BY`
- `HAVING`
- `ORDER BY`
- Aggregate functions
- `CASE WHEN`
- Type casting
- `TRIM`
- `NULLIF`
- Multi-column segmentation
- Common Table Expressions (CTEs)

## Project structure

```text
telco-churn-sql-analysis/
├── README.md
├── data/
│   └── Telco-Customer-Churn.csv
├── docs/
│   ├── data_dictionary.md
│   └── findings.md
└── sql/
    ├── 01_create_table.sql
    ├── 02_data_quality.sql
    ├── 03_exploratory_analysis.sql
    ├── 04_customer_segments.sql
    └── 05_cte_business_report.sql
```

## Analysis workflow

1. Created a PostgreSQL database and raw customer table.
2. Imported 7,043 customer records from a CSV file.
3. Checked record counts, duplicate IDs and missing values.
4. Validated numeric ranges and converted text fields during analysis.
5. Calculated the overall churn rate.
6. Compared churn across contracts, tenure groups, internet services and payment methods.
7. Combined multiple characteristics to identify high-risk segments.
8. Created a final risk-segment report using a CTE.
9. Translated the SQL results into business recommendations.

## Data-quality findings

- Total customer records: **7,043**
- Duplicate customer IDs: **0**
- Blank `total_charges` values: **11**
- All 11 affected customers have a tenure of zero months.
- Customer tenure ranges from 0 to 72 months.
- Monthly charges range from 18.25 to 118.75.
- Average monthly charge: **64.76**

The blank `total_charges` values appear to represent new customers who have not yet accumulated total charges.

## Key findings

### Overall churn

- Churned customers: **1,869**
- Retained customers: **5,174**
- Overall churn rate: **26.54%**

### Churn by contract

| Contract | Total customers | Churned customers | Churn rate |
|---|---:|---:|---:|
| Month-to-month | 3,875 | 1,655 | 42.71% |
| One year | 1,473 | 166 | 11.27% |
| Two year | 1,695 | 48 | 2.83% |

Month-to-month customers have a substantially higher churn rate than customers with longer contracts.

### Churn by tenure

| Tenure group | Total customers | Churned customers | Churn rate |
|---|---:|---:|---:|
| 0–12 months | 2,186 | 1,037 | 47.44% |
| 13–24 months | 1,024 | 294 | 28.71% |
| 25–48 months | 1,594 | 325 | 20.39% |
| 49–72 months | 2,239 | 213 | 9.51% |

Customers in their first year have the highest churn rate. Churn decreases as customer tenure increases.

### Churn by internet service

| Internet service | Total customers | Churned customers | Churn rate |
|---|---:|---:|---:|
| Fiber optic | 3,096 | 1,297 | 41.89% |
| DSL | 2,421 | 459 | 18.96% |
| No internet service | 1,526 | 113 | 7.40% |

Fiber-optic customers have more than twice the churn rate of DSL customers.

### Churn by payment method

| Payment method | Total customers | Churned customers | Churn rate |
|---|---:|---:|---:|
| Electronic check | 2,365 | 1,071 | 45.29% |
| Mailed check | 1,612 | 308 | 19.11% |
| Bank transfer (automatic) | 1,544 | 258 | 16.71% |
| Credit card (automatic) | 1,522 | 232 | 15.24% |

Electronic-check customers have the highest churn rate among the payment-method groups.

### Customer charges

| Churn status | Average monthly charges | Average total charges |
|---|---:|---:|
| No | 61.27 | 2,555.34 |
| Yes | 74.44 | 1,531.80 |

Churned customers pay more per month on average but accumulate lower total charges, which is consistent with their shorter customer tenure.

## High-risk customer segment

The highest-risk segment consists of customers with:

- A month-to-month contract
- Fiber-optic internet
- No technical support

This segment contains:

- **1,796 customers**
- **1,033 churned customers**
- **57.52% churn rate**

This group accounts for approximately **62.17% of all churned customers** in the dataset.

## Rule-based risk report

The final CTE assigns customers to three analytical risk segments:

| Risk segment | Total customers | Churned customers | Churn rate |
|---|---:|---:|---:|
| High risk | 1,796 | 1,033 | 57.52% |
| Medium risk | 2,079 | 622 | 29.92% |
| Low risk | 3,168 | 214 | 6.76% |

These are manually defined analytical segments, not predictions from a machine-learning model.

## Business recommendations

1. Prioritize month-to-month fiber-optic customers without technical support in retention campaigns.
2. Improve onboarding and engagement during the first 12 months.
3. Offer appropriate incentives for customers to move from month-to-month to longer contracts.
4. Investigate fiber-optic pricing, service reliability and support experiences.
5. Test free or discounted technical-support packages for high-risk customers.
6. Encourage suitable customers to use automatic payment methods.
7. Monitor churn after each retention initiative to measure its effectiveness.

## How to run the project

### 1. Prerequisites

Install PostgreSQL and confirm that `psql` is available:

```bash
psql --version
```

### 2. Create the database

```bash
psql -d postgres -c "CREATE DATABASE telco_churn;"
```

### 3. Create the raw table

From the project root:

```bash
psql -d telco_churn -f sql/01_create_table.sql
```

### 4. Import the CSV data

```bash
psql -d telco_churn -c "\copy telco_customers_raw FROM 'data/Telco-Customer-Churn.csv' WITH (FORMAT CSV, HEADER TRUE)"
```

Expected result:

```text
COPY 7043
```

### 5. Run the SQL analysis

```bash
psql -d telco_churn -f sql/02_data_quality.sql
psql -d telco_churn -f sql/03_exploratory_analysis.sql
psql -d telco_churn -f sql/04_customer_segments.sql
psql -d telco_churn -f sql/05_cte_business_report.sql
```

## Detailed findings

See [docs/findings.md](docs/findings.md) for the complete interpretation, recommendations and project limitations.

## Limitations

- The analysis identifies associations but does not prove causation.
- The risk categories are defined with SQL rules rather than a predictive model.
- The dataset does not include customer complaints, service outages, geographic information or satisfaction scores.
- The analysis represents one historical dataset and does not measure changes over time.

## Future improvements

- Build a cleaned analytical view with appropriate PostgreSQL data types.
- Add statistical significance tests.
- Develop a machine-learning churn prediction model.
- Evaluate feature importance and model fairness.
- Create an interactive Power BI or Tableau dashboard.
- Track experiments and model versions with MLflow.
- Deploy churn predictions through an API.

## Author

**Showaibuzzaman**  
Master’s student in Data Science  
Career focus: AI Engineering and MLOps