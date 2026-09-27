# Telco Customer Churn: Key Findings

## Dataset overview

This analysis examines 7,043 telecom customers to identify customer characteristics associated with churn. The dataset contains information about contracts, tenure, internet services, technical support, payment methods and customer charges.

The goal is to identify high-risk customer segments and propose practical retention strategies.

## Data-quality findings

The dataset contains 7,043 customer records and 21 columns. Every `customer_id` is unique, and no duplicate customer identifiers were found.

Eleven customers have blank `total_charges` values. All 11 customers have a tenure of zero months, indicating that they are new customers who have not yet accumulated total charges. These missing values therefore appear to be explainable rather than random data errors.

Customer tenure ranges from 0 to 72 months. Monthly charges range from 18.25 to 118.75, with an average of 64.76.

## Overall churn

Of the 7,043 customers, 1,869 churned and 5,174 remained with the company. The overall customer churn rate is **26.54%**.

This means that approximately one out of every four customers in the dataset left the company.

## Contract findings

Contract type has a strong association with customer churn:

- Month-to-month contracts: **42.71% churn**
- One-year contracts: **11.27% churn**
- Two-year contracts: **2.83% churn**

Month-to-month customers have a substantially higher churn rate than customers with longer contracts. Retention programs should therefore prioritize month-to-month customers and encourage suitable customers to consider longer-term contracts.

## Tenure findings

Customer churn decreases as tenure increases:

- 0–12 months: **47.44% churn**
- 13–24 months: **28.71% churn**
- 25–48 months: **20.39% churn**
- 49–72 months: **9.51% churn**

Customers in their first year have the highest churn rate. This suggests that onboarding, early customer support and first-year engagement are important areas for retention efforts.

## Internet-service findings

Churn rates vary considerably across internet-service categories:

- Fiber optic: **41.89% churn**
- DSL: **18.96% churn**
- No internet service: **7.40% churn**

Fiber-optic customers have more than twice the churn rate of DSL customers. The company should investigate fiber pricing, service reliability, customer expectations and support experiences.

## Payment-method findings

Electronic-check customers have the highest churn rate:

- Electronic check: **45.29% churn**
- Mailed check: **19.11% churn**
- Bank transfer (automatic): **16.71% churn**
- Credit card (automatic): **15.24% churn**

The company should investigate difficulties associated with electronic-check payments and consider encouraging customers to use automatic payment methods through incentives or a simpler enrollment process.

## Customer charge findings

Churned customers have an average monthly charge of **74.44**, compared with **61.27** for retained customers.

However, churned customers have lower average total charges: **1,531.80**, compared with **2,555.34** for retained customers. This is likely related to their shorter tenure: they pay more per month on average but leave before accumulating higher lifetime charges.

## High-risk customer segment

The highest-priority segment consists of customers who meet all three conditions:

- Month-to-month contract
- Fiber-optic internet service
- No technical support

This segment contains 1,796 customers, of whom 1,033 churned. Its churn rate is **57.52%**, and it accounts for approximately **62.17% of all churned customers**.

For comparison, the rule-based customer segments produced the following results:

- High risk: **57.52% churn**
- Medium risk: **29.92% churn**
- Low risk: **6.76% churn**

Among month-to-month fiber-optic customers, those without technical support had a churn rate of **57.52%**, compared with **38.86%** for customers with technical support.

## Business recommendations

1. Prioritize month-to-month fiber-optic customers without technical support in retention campaigns.
2. Improve onboarding and engagement during the first 12 months of the customer relationship.
3. Offer appropriate incentives for month-to-month customers to move to longer contracts.
4. Investigate fiber-optic pricing, reliability and customer-support experiences.
5. Test free or discounted technical-support packages for high-risk customers.
6. Encourage suitable customers to use automatic payment methods.
7. Track churn rates after each retention initiative to evaluate whether the intervention is effective.

## Limitations

This analysis identifies associations between customer characteristics and churn, but it does not prove that any individual factor causes customers to leave.

The risk segments are based on manually defined SQL rules rather than a trained machine-learning model. Additional information—including customer complaints, service outages, geographic location, acquisition channels and satisfaction scores—could improve the analysis.

Future work could include statistical testing, predictive churn modelling and controlled experiments to evaluate retention strategies.