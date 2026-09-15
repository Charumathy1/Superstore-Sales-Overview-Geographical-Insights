AWS SQL Results - Part 1 : Basic Filtering & Aggregation 

1. Central Region Records 
SELECT * 
FROM "AwsDataCatalog"."superstore-db"."superstore_dataset" 
WHERE "region" = 'Central'; 

2. First Class Shipping Records 
SELECT * 
FROM "AwsDataCatalog"."superstore-db"."superstore_dataset" 
WHERE "ship mode" = 'First Class'; 

3. Minimum Sales in Central Region 
SELECT MIN("sales") AS min_sales 
FROM "AwsDataCatalog"."superstore-db"."superstore_dataset" 
WHERE "region" = 'Central'; 

4. Maximum Sales in Central Region 
SELECT MAX("sales") AS max_sales 
FROM "AwsDataCatalog"."superstore-db"."superstore_dataset" 
WHERE "region" = 'Central'; 

5. Average Sales in Central Region 
SELECT AVG("sales") AS avg_sales 
FROM "AwsDataCatalog"."superstore-db"."superstore_dataset" 
WHERE "region" = 'Central'; 

6. Total Sales in Central Region 
SELECT SUM("sales") AS total_sales 
FROM "AwsDataCatalog"."superstore-db"."superstore_dataset" 
WHERE "region" = 'Central'; 

AWS SQL Results - Part 2 : Aggregation & Grouping 

7. Total Profit in Central Region 
SELECT SUM("profit") AS total_profit 
FROM "AwsDataCatalog"."superstore-db"."superstore_dataset" 
WHERE "region" = 'Central'; 

8. Region-wise Total Sales 
SELECT "region", SUM("sales") AS total_sales 
FROM "AwsDataCatalog"."superstore-db"."superstore_dataset" 
GROUP BY "region"; 

9. Category-wise Total Sales 
SELECT "category", SUM("sales") AS total_sales 
FROM "AwsDataCatalog"."superstore-db"."superstore_dataset" 
GROUP BY "category"; 

10. Category-wise Total Profit 
SELECT "category", SUM("profit") AS total_profit 
FROM "AwsDataCatalog"."superstore-db"."superstore_dataset" 
GROUP BY "category"; 

AWS SQL Results - Part 3 :Intermediate Analysis (Counts, Averages, Ranking) 

11. Region-wise Order Count 
SELECT "region", COUNT(*) AS order_count 
FROM "AwsDataCatalog"."superstore-db"."superstore_dataset" 
GROUP BY "region"; 

12. Ship Mode-wise Order Count 
SELECT "ship mode", COUNT(*) AS order_count 
FROM "AwsDataCatalog"."superstore-db"."superstore_dataset" 
GROUP BY "ship mode"; 

13. Category-wise Average Sales 
SELECT "category", AVG("sales") AS avg_sales 
FROM "AwsDataCatalog"."superstore-db"."superstore_dataset" 
GROUP BY "category"; 

14. Category-wise Average Profit 
SELECT "category", AVG("profit") AS avg_profit 
FROM "AwsDataCatalog"."superstore-db"."superstore_dataset" 
GROUP BY "category"; 

15. Products with Sales Greater than 500
SELECT * 
Products with Sales Greater than 500 
FROM "AwsDataCatalog"."superstore-db"."superstore_dataset" 
WHERE "sales" > 500;
