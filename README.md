# 🧹 Data Cleaning in MySQL – Layoffs Dataset  

## 📌 Project Overview  
This project demonstrates how to clean and standardize a real-world dataset using **MySQL**.  
The dataset (`layoffs.csv`) contains information about company layoffs, including company, industry, location, total laid off, dates, and funding.  

The main objective is to prepare the data for analysis by removing duplicates, handling inconsistent values, fixing date formats, and ensuring overall data quality.  

---

## 🎯 Objectives  
- Identify and remove **duplicate records**.  
- Standardize **industry names** and **country formats**.  
- Fix inconsistent **date formats**.  
- Handle **NULL values and blanks**.  
- Drop **unnecessary columns** to optimize the dataset.  

---

## 🛠 Tools Used  
- **MySQL Workbench** (for executing SQL queries and managing the database)  

---

## 📂 Project Files  
- **`data/layoffs.csv`** → Raw dataset before cleaning.  
- **`data/cleaned_layoffs.csv`** → Final dataset after cleaning.  
- **`sql/DATA CLEANING PROJECT.sql`** → Contains the full MySQL code for cleaning the dataset.  
  - Each section of the script is divided step by step, covering:  
    1. **Removing duplicates** → Using `ROW_NUMBER()` and temporary staging tables.  
    2. **Standardizing text values** → Fixing industry labels, trimming spaces, consistent capitalization.  
    3. **Fixing date formats** → Converting text-based dates to `DATE` type.  
    4. **Handling NULLs and blanks** → Replacing blanks with `NULL`, deciding whether to drop or impute.  
    5. **Dropping unused columns** → Removing irrelevant columns to streamline analysis.  

---

## 📊 Outcomes  
By the end of this cleaning process, the dataset becomes:  
- Free of duplicates.  
- Consistent in formatting across all text and date fields.  
- Ready for exploratory data analysis and visualization.  
