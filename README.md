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

## 🛠 Tools & Skills Used  
- **MySQL Workbench**  
- SQL techniques:  
  - CTEs (`ROW_NUMBER()`) for duplicate detection  
  - String functions (`TRIM`, `LIKE`)  
  - `UPDATE` with conditions for standardization  
  - `STR_TO_DATE` for date conversion  
  - `ALTER TABLE` for schema adjustments  

---

DELETE FROM layoffs_staging3
WHERE ROW_NUM = 2;
