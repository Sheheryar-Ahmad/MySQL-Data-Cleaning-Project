-- STEP 1: REMOVE DUPLICATES
-- STEP 2: STANDARDIZATION
-- STEP3:  NULLS AND BLANKS
-- STEP 4: USELESS COLUMNS

SELECT * FROM layoffs;



create table layoffs_staging
like layoffs;


select * from layoffs_staging;


insert layoffs_staging
select * from layoffs;

-- REMOVE DUPLICATES


WITH duplicates_cte AS
(
SELECT *,
ROW_NUMBER() OVER(PARTITION BY company, location, industry, total_laid_off, percentage_laid_off, `date`, country, funds_raised_millions) AS ROW_NUM
FROM layoffs_staging
)
SELECT *
FROM duplicates_cte
WHERE ROW_NUM > 1;

SELECT * 
FROM layoffs_staging
WHERE company = 'Casper';

-- CREATE ANOTHER TABLE WITH ROW_NUM AS AN ADDITIONAL COLUMN

CREATE TABLE `layoffs_staging2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `ROW_NUM` int
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

SELECT *
FROM layoffs_staging2;


INSERT layoffs_staging2
SELECT *,
ROW_NUMBER() OVER(PARTITION BY company, location, industry, total_laid_off, percentage_laid_off, `date`, country, funds_raised_millions) AS ROW_NUM
FROM layoffs_staging;

-- CREATE LAYOFFS_STAGING3 BCZ I ACCIDENTLY DOUBLE INSERTED THE VALUES IN LAYOFFS_STAGING2

CREATE TABLE `layoffs_staging3` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `ROW_NUM` int
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



INSERT layoffs_staging3
SELECT *,
ROW_NUMBER() OVER(PARTITION BY company, location, industry, total_laid_off, percentage_laid_off, `date`, country, funds_raised_millions) AS ROW_NUM
FROM layoffs_staging;

SELECT*
FROM layoffs_staging3
WHERE ROW_NUM = 2;

DELETE 
FROM layoffs_staging3
WHERE ROW_NUM = 2;

-- ALL THE DUPLICATES HAVE BEEN DELETED

-- STARTING STEP 2

SELECT*
FROM layoffs_staging3;

-- REMOVE WHITESPACES FROM company COLUMN FOR VISUALIZATION

SELECT company, TRIM(company), LENGTH(company), LENGTH(TRIM(company))
FROM layoffs_staging3;

UPDATE layoffs_staging3
SET company = TRIM(company);

-- SAME INDUSTRIES WITH SIMILAR NAMES SHOULD HAVE THE EXACT SAME NAMES FOR VISUALIZATION

SELECT DISTINCT industry
FROM layoffs_staging3
ORDER BY 1;

-- FOUND DIFFERENT NAMES FOR CRYPTO LIKE 'Crypto Currency' 'CryptoCurrency' 'Crypto' FOR VISUALIZATION

SELECT *
FROM layoffs_staging3
WHERE industry LIKE 'Crypto%';

UPDATE layoffs_staging3
SET industry = 'Crypto'
WHERE industry LIKE 'Crypto%';

-- CHECK TO SEE IF 1 COUNTRY HAS DIFFERENTLY FORMATTED NAMES (FOUND 'United States' AND 'United States.') FOR VISUALIZATION

SELECT DISTINCT country
FROM layoffs_staging3
ORDER BY 1;

SELECT * 
FROM layoffs_staging3
WHERE country LIKE 'United States.%';

UPDATE layoffs_staging3
SET country = 'United States'
WHERE country = 'United States.';

-- SET DATE TO STANDARD FORMAT AND CONVERT FROM INT/STRING TO ACTUAL DATE FORMAT FOR TIMELINES DURING VISUALIZATION

SELECT `date`, STR_TO_DATE(`date`, '%m/%d/%Y')
FROM layoffs_staging3;

UPDATE layoffs_staging3
SET `date` = STR_TO_DATE(`date`, '%m/%d/%Y');


SELECT `date`
FROM layoffs_staging3;

-- TO CHANGE THE DATA TYPE OF THE DATE COLUMN YOU FIRST HAVE TO CHANGE IT INTO PROPER FORMAT WITH THE ABOVE QUERY OTHERWISE IT WILL GIVE AN ERROR
-- NOW CHANGE THE DATA TYPE


ALTER TABLE layoffs_staging3
MODIFY COLUMN `date` DATE;
























