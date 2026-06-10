# End-to-End Enterprise Business Intelligence Pipeline
**Author:** Festus Ejideaku  
**Role:** Data Analytics Intern  
**Company:** decodeLabs_tech  
**Project Overview:** Data Cleaning, Statistical Audit, Relational Database Warehousing, and Executive Dashboarding for a 1,200-row retail transaction dataset.

---

## 📌 Project Overview
This repository documents the comprehensive, four-stage data analytics lifecycle completed during my internship at decodeLabs. The objective was to take raw, unformatted transaction logs, process them through a rigorous data engineering pipeline, enforce database architecture constraints in SQL Server, and deliver actionable insights via an interactive presentation layer in Power BI.

---

## 🛠️ Detailed Pipeline Breakdown

### 🔹 Project 1: Advanced Data Cleaning (Excel & Power Query)
* **Objective:** Clean, standardize, and enforce structural schema integrity across 1,200 raw transactional logs.
* **Methodology:**
  * **Missing Data Imputation:** Loaded the raw dataset into the Power Query Editor and replaced blank promotional rows in the `CouponCode` column with a uniform `"NO_COUPON"` string metric to ensure data completeness.
  * **Entity Integrity Audit:** Executed duplicate removal on the `OrderID` header column to guarantee absolute row uniqueness and remove redundant IDs.
  * **Strict Data Type Casting:** Forced schema boundaries by converting historical data to `Date` formats and financial columns (`UnitPrice`, `TotalPrice`) strictly to `Currency` with a fixed two-decimal layout.
* **Core Deliverable:** Stored in the `Project_1_Data_Cleaning/` folder.

---

### 🔹 Project 2: Exploratory Data Analysis (EDA)
* **Objective:** Conduct a baseline statistical evaluation, discover transactional velocity patterns, and isolate financial anomalies.
* **Methodology & Key Metrics:**
  * Developed a core descriptive statistics summary sheet to discover the financial "center of gravity" of our transactions.
  * **Outlier Isolation:** Located and isolated 8 extreme wholesale transactions ranging from **$3,334.25 to $3,456.40**. These represented bulk purchases (5 units) of high-end items like Laptops and Monitors that skewed the typical retail averages.
  * **Pivot Table Slicing:** Created categorical cross-sections to rank revenue contribution by product line and map timeline sales fluctuations.
* **Verified Baseline Audit Figures:**
  * *Total Sales Revenue:* $1,264,761.96
  * *Total Order Volume:* 1,200
  * *Average Order Value (Mean):* $1,053.97
  * *Typical Order Value (Median):* $823.62
  * *Minimum Order Value:* $11.39  |  *Maximum Order Value:* $3,456.40
* **Core Deliverable:** Stored in the `Project_2_Exploratory_Data_Analysis/` folder.

---

### 🔹 Project 3: Production Database Warehousing (SQL Server)
* **Objective:** Migrate flat-file structures into a relational database management system (RDBMS) and construct business logic queries.
* **Methodology:**
  * Generated and deployed a database schema environment named `DecodeLabs_Analytics`.
  * Imported the cleaned dataset via the Flat File Import Wizard, enforcing `OrderID` as a Primary Key constraint.
  * Formulated highly targeted corporate reporting queries to measure organizational friction and marketing performance:
    * **Fulfillment Distribution Validation:** Evaluated order status volumes alongside precise percentage allocations to reveal operational vulnerabilities (Cancellations and Returns).
    * **Marketing Attribution (ROI):** Aggregated revenue metrics by channel, isolating **Instagram** as the top customer acquisition platform.
    * **Conditional Segment Filtering:** Applied nested query aggregations using `WHERE Quantity >= 3` combined with a `HAVING` clause filtering `AVG(TotalPrice) >= 1050.00` to extract high-volume product segments.
* **Core Deliverable:** Stored in the `Project_3_SQL_Database_Warehouse/` folder.

---

### 🔹 Project 4: Interactive Executive Visual Dashboard (Power BI)
* **Objective:** Synthesize analytical insights into a single-page interactive dashboard for real-time executive decision-making.
* **Visualized Corporate Insights:**
  1. **Revenue Dominance:** Displays financial contribution across product categories, highlighting *Chairs* and *Printers* as the primary cash-flow drivers ($195K+ each).
  2. **Operational Friction:** A Donut chart mapping fulfillment health, exposing that *Cancelled* (20.83%) and *Returned* (20.58%) orders represent major friction points.
  3. **Marketing ROI:** A specialized "Hero Focus" Treemap utilizing a vibrant high-contrast palette to spotlight *Instagram's* revenue performance ($275K+).
  4. **Payment Preferences:** A Clustered Column chart illustrating clear consumer reliance on digital liquidity tools (*Credit Cards* and *Online* transfers).
  5. **Promotional Conversion:** A Funnel chart visualization that tracks user engagement drop-offs and organic purchase rates across discount codes.
* **Interactive Architecture:** Configured global canvas slicers (`OrderStatus` and `CouponCode`) that enable stakeholders to dynamically cross-filter the entire dashboard landscape with a single click.
* **Core Deliverable:** Stored in the `Project_4_PowerBI_Dashboard/` folder. Includes the `.pbix` file and a static image preview.
