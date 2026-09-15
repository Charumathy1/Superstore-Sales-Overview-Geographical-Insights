# 📊 Superstore Sales Overview & Geographic Insights

An end-to-end cloud analytics project built on the Superstore dataset — from raw data storage on AWS to an interactive Power BI dashboard.

**Prepared by:** P. Charumathy

---

## 🧭 Project Objective

The goal of this project is to build a complete, cloud-based data analytics pipeline using the Superstore dataset. The pipeline covers:

- Storing raw data in **Amazon S3**
- Managing secure access using **AWS IAM**
- Automatically discovering the data schema with **AWS Glue Crawler**
- Cataloging the data in the **AWS Glue Data Catalog**
- Running SQL analysis with **Amazon Athena**
- Cleaning and transforming data using **Power Query**
- Building an interactive two-page dashboard in **Power BI**

The final output is a Power BI dashboard with two pages:
1. **Sales Overview** — KPI cards, charts, and key sales/profit metrics
2. **Geographic and Customer Insights** — location-based visuals, customer ranking, and regional performance

---

## 🏗️ Architecture / Workflow

```
Superstore Dataset (.csv)
        │
        ▼
   Amazon S3 (raw storage)
        │
        ▼
   AWS Glue (Crawler → Data Catalog)
        │
        ▼
   Amazon Athena (SQL queries)
        │
        ▼
   Power BI (via ODBC + Power Query + DAX)
        │
        ▼
   Superstore Dashboard (2 pages)
```

---

## 🛠️ Tech Stack

### Cloud Data Infrastructure (AWS)

| Service | Purpose |
|---|---|
| Amazon S3 | Scalable cloud storage — source bucket for raw data, results bucket for query output |
| AWS IAM | Role-based, secure access control for the Glue Crawler |
| AWS Glue | Database + Crawler → Table — automated schema discovery and cataloging |
| Amazon Athena | Serverless SQL query execution on the cataloged table |

### Data Visualization

| Service | Purpose |
|---|---|
| Power BI | Interactive dashboard, connected to Athena via ODBC |
| Power Query | Data cleaning and transformation (nulls, date formats, data types) |
| DAX | Calculated measures for KPIs and profitability metrics |

---

## 🚀 Project Steps

### Step 1: AWS Management Console Setup
- Signed in to the AWS Management Console
- Enabled Multi-Factor Authentication (MFA) for account security
- Verified access to the console dashboard

### Step 2: Create S3 Buckets
- `charu-etl-source-bucket` — holds the raw Superstore dataset
- `charu-etl-results-bucket` — holds Athena query results
- Downloaded the sample Superstore dataset (.csv) and uploaded it to the source bucket

### Step 3: Configure IAM Role
- Created an IAM role for the Glue Crawler with:
  - `AmazonS3FullAccess` — bucket access
  - `AWSGlueServiceRole` — Glue service access

### Step 4: AWS Glue — Database, Crawler, and Table
- **4.1** Created a database (`superstore-db`) in the Glue Data Catalog
- **4.2** Created a crawler (`charu-etl-crawler`) pointing to the S3 data source, using the IAM role from Step 3, set to crawl all sub-folders on demand
- **4.3** Ran the crawler manually and verified the table was created successfully in the Data Catalog

### Step 5: Amazon Athena — SQL Analysis
Set the query result location to the results bucket, selected the Glue-cataloged table, and ran SQL queries in three parts:

**Part 1 — Basic Filtering & Aggregation**
- Central region records, First Class shipping records
- MIN, MAX, AVG, and SUM of sales in the Central region

**Part 2 — Aggregation & Grouping**
- Total profit in the Central region
- Region-wise and category-wise total sales and profit

**Part 3 — Intermediate Analysis**
- Region-wise and ship-mode-wise order counts
- Category-wise average sales and profit
- Products with sales greater than 500

### Step 6: Simba Athena ODBC — Connect Athena to Power BI
- Installed the Simba Amazon Athena ODBC driver on Windows
- Configured a DSN (Data Source Name) with the AWS region, catalog, and workgroup
- Enabled Power BI to query the Athena table directly

### Step 7: Power BI — Connect and Visualize
- Connected via **Get Data → ODBC** using the configured DSN
- Cleaned data using Power Query (nulls, mixed date formats, data types)
- Created DAX measures for Total Sales, Total Profit, Profit Margin, Loss Orders, Average Order Value, and Average Quantity per Order
- Built a two-page interactive dashboard: **Executive Overview** and **Profitability Analysis**

---

## 📈 Dashboard Highlights

### Page 1 — Sales Overview
- **Total Sales:** 1.91M
- **Total Profit:** 249.46K
- **Total Orders:** 4K
- **Total Quantity:** 29K
- **Average Discount:** 0.16
- Visuals: Monthly sales trend, sales by segment, profit by sub-category, sales by category

### Page 2 — Geographic and Customer Insights
- **Top State by Sales:** California
- **Top Customer by Sales:** Sean Miller
- **Number of Selling States:** 49
- **Average Quantity per Order:** 6.73
- Visuals: Sales by city (map), state performance table, sales by region, customer sales ranking, sales by state (map)

---

## 📂 Repository Structure

Superstore-Sales-Cloud-Analytics/
│
├── README.md                         
│
├── data/
│   └── superstore_dataset.csv         
│
├── sql/
│   ├── part1_filtering_aggregation.sql   
│   ├── part2_aggregation_grouping.sql   
│   └── part3_intermediate_analysis.sql  
│
├── dashboard/
│   └── Superstore_Dashboard.pbix     
│
├── docs/
│   ├── Superstore_Sales_Overview_synopsys.pdf    
│   ├── Superstore_Sales_Overview_Documentation.pdf    
│
└── ppt/
    └── Superstore_Presentation.pptx   

---

## ✅ Key Learnings

- Setting up secure, role-based access between AWS services using IAM
- Automating schema discovery and cataloging with AWS Glue
- Running serverless SQL analysis at scale with Amazon Athena
- Connecting a cloud data warehouse to Power BI using ODBC
- Building business-ready KPIs and dashboards using Power Query and DAX

---

## 📄 License

This project is for academic purposes as part of the DBA – Data and Business Analysis course.
