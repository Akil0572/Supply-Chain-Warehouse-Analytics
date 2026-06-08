create database supply_chain ;

use supply_chain ;
drop database supply_chain ;
describe supplychain_50k;

SHOW COLUMNS FROM supplychain_50k;

SELECT COUNT(*) AS Total_Rows
FROM supplychain_50k;

SELECT COUNT(DISTINCT `Order Id`) AS Unique_Orders
FROM supplychain_50k;

SELECT COUNT(DISTINCT `Customer Id`) AS Unique_Customers
FROM supplychain_50k;

SELECT COUNT(DISTINCT `Product Card Id`) AS Unique_Products
FROM supplychain_50k;

SELECT ROUND(SUM(Sales),2) AS Total_Revenue
FROM supplychain_50k;

SELECT ROUND(SUM(`Order Profit Per Order`),2) AS Total_Profit
FROM supplychain_50k;

SELECT ROUND(AVG(Sales),2) AS Avg_Order_Value
FROM supplychain_50k;

SELECT SUM(`Order Item Quantity`) AS Total_Quantity
FROM supplychain_50k;

SELECT
`Product Name`,
ROUND(SUM(Sales),2) AS Revenue
FROM supplychain_50k
GROUP BY `Product Name`
ORDER BY Revenue DESC
LIMIT 10;


SELECT
`Product Name`,
ROUND(SUM(`Order Profit Per Order`),2) AS Profit
FROM supplychain_50k
GROUP BY `Product Name`
ORDER BY Profit DESC
LIMIT 10;

SELECT
`Product Name`,
ROUND(SUM(`Order Profit Per Order`),2) AS Profit
FROM supplychain_50k
GROUP BY `Product Name`
ORDER BY Profit ASC
LIMIT 10;

SELECT
`Category Name`,
ROUND(SUM(Sales),2) Revenue,
ROUND(SUM(`Order Profit Per Order`),2) Profit
FROM supplychain_50k
GROUP BY `Category Name`
ORDER BY Revenue DESC;


SELECT
`Customer Segment`,
ROUND(SUM(Sales),2) Revenue
FROM supplychain_50k
GROUP BY `Customer Segment`
ORDER BY Revenue DESC;


SELECT
`Customer Id`,
ROUND(SUM(Sales),2) Revenue
FROM supplychain_50k
GROUP BY `Customer Id`
ORDER BY Revenue DESC
LIMIT 20;


SELECT
`Delivery Status`,
COUNT(*) Orders_Count
FROM supplychain_50k
GROUP BY `Delivery Status`;


SELECT
Late_delivery_risk,
COUNT(*) Orders_Count
FROM supplychain_50k
GROUP BY Late_delivery_risk;

SELECT
`Shipping Mode`,
COUNT(*) Orders_Count,
ROUND(AVG(`Days for shipping (real)`),2) Avg_Delivery_Days
FROM supplychain_50k
GROUP BY `Shipping Mode`;

SELECT
ROUND(
AVG(`Days for shipping (real)` -
`Days for shipment (scheduled)`),2)
AS Avg_Delay
FROM supplychain_50k;


SELECT
`Order Country`,
ROUND(SUM(Sales),2) Revenue
FROM supplychain_50k
GROUP BY `Order Country`
ORDER BY Revenue DESC
LIMIT 20;

SELECT
`Order Region`,
ROUND(SUM(Sales),2) Revenue
FROM supplychain_50k
GROUP BY `Order Region`
ORDER BY Revenue DESC;

SELECT
`Order Region`,
ROUND(SUM(`Order Profit Per Order`),2) Profit
FROM supplychain_50k
GROUP BY `Order Region`
ORDER BY Profit DESC;


-- DATA CLEANING --

SELECT COUNT(*) FROM supplychain_50k;


SELECT
SUM(CASE WHEN Sales IS NULL THEN 1 ELSE 0 END) AS Null_Sales,
SUM(CASE WHEN `Order Profit Per Order` IS NULL THEN 1 ELSE 0 END) AS Null_Profit,
SUM(CASE WHEN `Shipping Mode` IS NULL THEN 1 ELSE 0 END) AS Null_Shipping
FROM supplychain_50k;

SELECT 
`Order Id`, 
COUNT(*) AS Duplicate_Count
FROM supplychain_50k
GROUP BY `Order Id`
HAVING COUNT(*) > 1;

SELECT
COUNT(*) AS Late_Orders
FROM supplychain_50k
WHERE `Days for shipping (real)` >
      `Days for shipment (scheduled)`;
      
SELECT
COUNT(*) AS Late_Orders
FROM supplychain_50k
WHERE `Days for shipping (real)` >
      `Days for shipment (scheduled)`;
      
      
SELECT ROUND(SUM(Sales),2) AS Total_Revenue
FROM supplychain_50k;

SELECT ROUND(SUM(`Order Profit Per Order`),2) AS Total_Profit
FROM supplychain_50k;

SELECT ROUND(AVG(Sales),2) AS Avg_Order_Value
FROM supplychain_50k;

SELECT
ROUND(
100*
SUM(
CASE
WHEN `Days for shipping (real)` >
`Days for shipment (scheduled)`
THEN 1 ELSE 0
END
)/COUNT(*),2
) AS Late_Delivery_Percentage
FROM supplychain_50k;

SELECT
`Product Name`,
ROUND(SUM(Sales),2) Revenue
FROM supplychain_50k
GROUP BY `Product Name`
ORDER BY Revenue DESC
LIMIT 10;

SELECT
`Product Name`,
ROUND(SUM(`Order Profit Per Order`),2) Profit
FROM supplychain_50k
GROUP BY `Product Name`
ORDER BY Profit DESC
LIMIT 10;

SELECT
`Order Region`,
ROUND(SUM(Sales),2) Revenue
FROM supplychain_50k
GROUP BY `Order Region`
ORDER BY Revenue DESC;

SELECT
`Order Region`,
ROUND(SUM(`Order Profit Per Order`),2) Profit
FROM supplychain_50k
GROUP BY `Order Region`
ORDER BY Profit DESC;

SELECT
`Category Name`,
ROUND(SUM(Sales),2) Revenue
FROM supplychain_50k
GROUP BY `Category Name`
ORDER BY Revenue DESC;

SELECT
`Category Name`,
ROUND(SUM(`Order Profit Per Order`),2) Profit
FROM supplychain_50k
GROUP BY `Category Name`
ORDER BY Profit DESC;

-- WAREHOUSE ANALYSIS -- 

SELECT
`Shipping Mode`,
COUNT(*) Orders_Count,
ROUND(AVG(`Days for shipping (real)`),2) Avg_Delivery_Days
FROM supplychain_50k
GROUP BY `Shipping Mode`;

SELECT
`Delivery Status`,
COUNT(*) Orders
FROM supplychain_50k
GROUP BY `Delivery Status`;

SELECT
`Order Region`,
COUNT(*) Late_Orders
FROM supplychain_50k
WHERE `Days for shipping (real)` >
      `Days for shipment (scheduled)`
GROUP BY `Order Region`
ORDER BY Late_Orders DESC;

SELECT
`Customer Segment`,
COUNT(*) Orders
FROM supplychain_50k
GROUP BY `Customer Segment`
ORDER BY Orders DESC;

SELECT
`Customer Segment`,
ROUND(SUM(Sales),2) Revenue
FROM supplychain_50k
GROUP BY `Customer Segment`
ORDER BY Revenue DESC;

SELECT
`Customer Segment`,
ROUND(SUM(`Order Profit Per Order`),2) Profit
FROM supplychain_50k
GROUP BY `Customer Segment`
ORDER BY Profit DESC;

select * from supplychain_50k;
