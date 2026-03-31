Running the entire table 
-- 1. SELECT *
FROM  `workspace`.`default`.`_bright_coffee_shop_analysis_case_study_1_1`;

---2. Creating date range ( Min_date 23-01-01 and Max_date 23-06-30)
SELECT 
    MIN(transaction_date) AS Min_date,
    MAX(transaction_date) AS Max_date
FROM `workspace`.`default`.`_bright_coffee_shop_analysis_case_study_1_1`;

---3. Checking the difference store location(3 DIIFERENT STROE LOCATION)
SELECT
 DISTINCT store_location
 FROM `workspace`.`default`.`_bright_coffee_shop_analysis_case_study_1_1`;

---4. Checking Product sold at our stores(9 product store category)
SELECT
DISTINCT product_category
 FROM `workspace`.`default`.`_bright_coffee_shop_analysis_case_study_1_1`;


 ---5. Checking product types sold at our store(29 DIFFERENT product type)
 SELECT
 DISTINCT product_type
 FROM `workspace`.`default`.`_bright_coffee_shop_analysis_case_study_1_1`;

 ----6. Checking product details sold at our store(80 different product categories)
  SELECT DISTINCT product_detail
FROM default._bright_coffee_shop_analysis_case_study_1_1;



----7. Checking NULLS VALUES IN VARIOUS COLUMNS

 SELECT*
 FROM default._bright_coffee_shop_analysis_case_study_1_1
 WHERE Unit_price IS NULL
 OR transaction_qty IS NULL
 OR transaction_date IS NULL;

----8. Checking the Lowest and Highest Unit price
   SELECT Min(Unit_price) AS lowest_unit_price,
         Max(Unit_price) As highest_unit_price 
FROM default._bright_coffee_shop_analysis_case_study_1_1;

---9. Extracting the DAY and MONTH Name

SELECT 
transaction_date,  
Dayname(transaction_date)AS Day_name,
Monthname(transaction_date)AS Month_name
FROM default._bright_coffee_shop_analysis_case_study_1_1;

---10. Caluclating the Revenue 
  SELECT unit_price,
  transaction_qty,
  unit_price*transaction_qty AS Revenue
  FROM default._bright_coffee_shop_analysis_case_study_1_1;

  SELECT*
  FROM default._bright_coffee_shop_analysis_case_study_1_1;
  
----11. Combining  function to get a clean and enhanced data set
    SELECT 
    transaction_id,
    transaction_date,
    transaction_time,
    transaction_qty,
    store_id,
    store_location,
    product_id
    unit_price,
    product_category,
    product_type,
    product_detail,
    FROM default._bright_coffee_shop_analysis_case_study_1_1;

12. Adding columns to enhance the table for better insights

Dayname(transaction_date) AS day_name,
Monthname(transaction_date) AS month_name,
Day of month(transaction_date) AS data_of month
select * from `workspace`.`default`.`_bright_coffee_shop_analysis_case_study_1_1` limit 100;

-------------------------------------------------------------------------------------------------------------
BRIGHT COFFESHOP CODING 
-------------------------------------------------------------------------------------------------------------
Running the entire table 
-- 1. SELECT *
      FROM  `workspace`.`default`.`_bright_coffee_shop_analysis_case_study_1_1`;

---2. Creating date range ( Min_date 23-01-01 and Max_date 23-06-30)
    SELECT 
    MIN(transaction_date) AS Min_date,
    MAX(transaction_date) AS Max_date
FROM `workspace`.`default`.`_bright_coffee_shop_analysis_case_study_1_1`;

---3. Checking the difference store location(3 DIIFERENT STROE LOCATION)
SELECT
 DISTINCT store_location
 FROM `workspace`.`default`.`_bright_coffee_shop_analysis_case_study_1_1`;

---4. Checking Product sold at our stores(9 product store category)
 SELECT
DISTINCT product_category
FROM `workspace`.`default`.`_bright_coffee_shop_analysis_case_study_1_1`;


 ---5. Checking product types sold at our store(29 DIFFERENT product type)
 SELECT
 DISTINCT product_type
 FROM `workspace`.`default`.`_bright_coffee_shop_analysis_case_study_1_1`;

 ----6. Checking product details sold at our store(80 different product categories)
  SELECT DISTINCT product_detail
FROM default._bright_coffee_shop_analysis_case_study_1_1;

----7. Checking NULLS VALUES IN VARIOUS COLUMNS

 SELECT*
 FROM default._bright_coffee_shop_analysis_case_study_1_1
 WHERE Unit_price IS NULL
 OR transaction_qty IS NULL
 OR transaction_date IS NULL;

----8. Checking the Lowest and Highest Unit price
  SELECT Min(Unit_price) AS lowest_unit_price,
         Max(Unit_price) As highest_unit_price 
FROM default._bright_coffee_shop_analysis_case_study_1_1;

---9. Extracting the DAY and MONTH Name

SELECT 
transaction_date,  
Dayname(transaction_date)AS Day_name,
Monthname(transaction_date)AS Month_name
FROM default._bright_coffee_shop_analysis_case_study_1_1;

---10. Caluclating the Revenue 
  SELECT unit_price,
  transaction_qty,
  unit_price*transaction_qty AS Revenue
  FROM default._bright_coffee_shop_analysis_case_study_1_1;

  SELECT*
  FROM default._bright_coffee_shop_analysis_case_study_1_1;
  
----11. Combining  function to get a clean and enhanced data set
     SELECT 
     transaction_id,
     transaction_date,
     transaction_time,
     transaction_qty,
     store_id,
     store_location,
     product_id,
     unit_price,
     product_category,
     product_type,
     product_detail,
  --adding columns to enhance table for better insights  
   Dayname(transaction_date)AS Day_name,
   Monthname(transaction_date)As month_name,
   Dayofmonth(transaction_date)AS date_of_month,
----New column added 4 determining weekday and weekends

   CASE
     WHEN Dayname(transaction_date) IN ('Sunday', 'Saturday') THEN 'weekend'
     ELSE 'weekday'
     END AS Day_Classification,
    --- Time buckets
   CASE
      
        WHEN date_format(transaction_time, 'HH:mm:ss') BETWEEN '05:00:00' AND '08:59:59' THEN '01.Rush Hour'
        WHEN date_format(transaction_time, 'HH:mm:ss') BETWEEN '09:00:00' AND '11:59:59' THEN '02.Mid Morning'
        WHEN date_format(transaction_time, 'HH:mm:ss') BETWEEN '12:00:00' AND '15:59:59' THEN '03.Afternoon'
        WHEN date_format(transaction_time, 'HH:mm:ss') BETWEEN '16:00:00' AND '18:00:00' THEN '04.Rush Hour'
        ELSE '05.Night'
    END AS Time_Classification,
   CASE     
---New Column added 6 - Spend buckets

  
   WHEN(transaction_qty* unit_price)<50 THEN '01.Low Spend'
   WHEN(transaction_qty*unit_price) BETWEEN 51 AND 200 THEN '02.Medium Spend'
   WHEN (transaction_qty*unit_price)BETWEEN 201 AND 300 THEN '03. Moreki'
   ELSE '04.Blesser'
   END AS Spend_bucket,

---New Column added 7 
  transaction_qty*unit_price AS Revenue
  FROM default._bright_coffee_shop_analysis_case_study_1_1;

