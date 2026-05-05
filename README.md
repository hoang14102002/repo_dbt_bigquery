## dbt_bigquery_project

## Overview

This is a personal project using dbt Core to build modern data pipelines on Google BigQuery.
The project focuses on transforming raw data into clean, reliable, and analytics-ready datasets using modular dbt models.

## Technologies

- dbt: Data transformation, modeling and testing
- Google BigQuery: Scalable cloud data warehouse
- SQL: Writing transformation logic inside dbt models

## Goals

- Practice how to connect Google BigQuery with dbt
- Practice building data pipelines with dbt on BigQuery
- Apply best practices for data modeling (staging → intermediate → marts)
- Ensure data quality using tests and documentation
- Create reusable and scalable transformation logic

## Project Structure
dbt_project/

├── models/ # Transformation models (tables/views)

├── tests/ # Data tests

├── macros/ # Reusable macros

├── snapshots/ # Data snapshots (if any)

├── dbt_project.yml

└── README.md

## How to use
```bash
1. Clone the repository:
git clone https://github.com/hoang14102002/repo_dbt_bigquery.git
cd repo_dbt_bigquery

2. Install dbt (if not installed):
Install dbt (if not installed):
pip install dbt-bigquery

3. Configure your profiles.yml to connect to SQL Server:
your_profile_name:
  target: dev
  outputs:
    dev:
      type: bigquery
      method: service-account
      project: <your_project_id>
      dataset: <your_dataset>
      threads: 4
      keyfile: /path/to/your/service-account.json

4. Run dbt commands:
dbt run            # Run models
dbt test           # Run tests
dbt docs generate  # Generate documentation
dbt docs serve     # View documentation
