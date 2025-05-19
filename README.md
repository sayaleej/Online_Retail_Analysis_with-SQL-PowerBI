# 🛍️ Online Retail Analysis

This project explores online retail transaction data using a mix of **SQL for data cleaning and exploration** and **Power BI** for creating an interactive, insightful dashboard.

---

## 📂 Project Structure

Here's how everything is organized:

OnlineRetail_PowerBI_Dashboard/
│
├── README.md 
├── DATA/
│ ├── online_retail
│ └── online_retail_clean.csv # cleaned data for analysis
│
├── Power BI/
│ └── Dashboard_OnlineRetail.pbix
│ └── Power BI report preview.pdf
│
├── SQL/
│ └──  create_table.sql
│ └──  data_cleaning.sql
│ └──  data_querying.sql
|

---

## 📌 About the Dataset

The dataset contains ~540K transaction records from a UK-based online retailer (2010–2011). It includes:

- **Customer info** (`CustomerID`, `Country`)
- **Product info** (`StockCode`, `Description`)
- **Transaction info** (`InvoiceNo`, `Quantity`, `UnitPrice`, `InvoiceDate`)

---

## 🧹 Data Cleaning (SQL in pgAdmin)

Before jumping into Power BI, I used SQL to clean and prep the data:

- Replaced missing `CustomerID` with `'0'` (represents guest customers)
- Removed invalid entries (`Quantity <= 0`, `UnitPrice <= 0`)
- De-duplicated records using `GROUP BY`
- Trimmed product descriptions and made them lowercase

---

## 🔍 SQL Data Exploration

I also ran several queries to get a sense of what was going on in the data:

- Total revenue per customer
- Customers with only one order
- Top countries by number of customers
- Most purchased products and combinations
- Monthly revenue trends

These insights helped shape the Power BI report structure.

---

## 📊 Power BI Dashboard Highlights

### 💰 Executive Summary Page
- Monthly revenue trend line chart
- Monthly transactions trend line chart
- KPI : Total Revenue, Total Orders
- Country-wise revenue 

### 🗺️ Map View Page
- Country-Wise Revenue Map showing where your money comes from

### 🧍 Customer Report Page
- Top 10 spenders & top order-makers 
- Total spend and order count per customer
- Guest vs Registered customer counts
- Repeat Customer Rate (%)
- Slicer: Country filter 

### 📦 Product Report Page
- Top-selling and highest revenue products
- Slicer: Country filter and date filter

---


## 🧮 DAX Measures Used

Some custom measures built using DAX:

- `Total Revenue`  
- `Total Orders per Customer`  
- `Repeat Customer Rate (%)`  
- `Guest Customer Count`  
- `Registered Unique Customers`  
- `Monthly Revenue`  
- `Top Products by Revenue / Quantity`

---

## 🧰 Tools & Tech

- **PostgreSQL** (via pgAdmin) – Data cleaning & SQL queries  
- **Power BI Desktop** – Dashboard design & visuals  
- **DAX** – Custom calculations  
- **VS Code** – Script management  

---

## 🚀 Possible Improvements

- Add RFM-based customer segmentation  
- Build predictive revenue trends  
- Tag or cluster products (if more metadata available)

---

Thanks for reading! ⭐️
