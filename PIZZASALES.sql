USE SALES;

SELECT * FROM PIZZA_SALES LIMIT 10;

SELECT round(sum(Total_price),2) as Total_Revenue  
FROM PIZZA_SALES;

SELECT round(sum(Total_price) /COUNT(distinct Order_id ),2 ) as Average_Order_Value
FROM PIZZA_SALES;

SELECT sum(Quantity) as Total_Pizza_sold
FROM PIZZA_SALES;

SELECT COUNT(distinct Order_id ) as Total_Orders
FROM PIZZA_SALES;

SELECT  round(sum(Quantity) / COUNT(distinct Order_id ),2)  as Avg_Pizza_Per_Order
FROM PIZZA_SALES;

-- CHARTS-- 


SELECT 
DAYNAME(STR_TO_DATE(order_date, '%Y-%m-%d')) AS order_day,
COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY 
DAYNAME(STR_TO_DATE(order_date, '%Y-%m-%d'))
ORDER BY total_orders DESC;


SELECT
MONTHNAME(order_date)   AS Month,  
COUNT(DISTINCT order_id) AS Total_orders
FROM pizza_sales
GROUP BY MONTHNAME(order_date)
order by Total_orders desc;

SELECT 
pizza_category ,
round(SUM(Total_price),2) AS Sales,
round(SUM(Total_price) *100 / (select (SUM(Total_price)) FROM  Pizza_sales),2) as Percentage
FROM pizza_sales
GROUP BY pizza_category
order by Sales DESC;



SELECT 
pizza_size ,
round(SUM(Total_price),2) AS Sales,
round(SUM(Total_price) *100 / (select (SUM(Total_price)) FROM  Pizza_sales),2) as Percentage
FROM pizza_sales
GROUP BY pizza_size
order by Sales DESC;

SELECT
pizza_category,
SUM(Quantity) as pizzas_sold   -- COUNT OF PIZZA
FROM pizza_sales
GROUP BY pizza_category;

-- TO5 BEST AND WORST SELLER 

SELECT
pizza_name,
sum(total_price) as Salesamount                 --   BEST SELLING BY REVENUE
FROM pizza_sales
GROUP BY  pizza_name                       
ORDER BY Salesamount desc
limit 5;

SELECT
pizza_name,
sum(total_price) as Salesamount                 --    BOTTOM 5 SELLING BY REVENUE
FROM pizza_sales
GROUP BY  pizza_name
ORDER BY Salesamount
limit 5;

SELECT
pizza_name,
sum(Quantity) as Total_pizza_sold              --    TOP 5 SELLING BY  QUANTITY
FROM pizza_sales
GROUP BY  pizza_name
ORDER BY Total_pizza_sold  desc
limit 5;

SELECT
pizza_name,
sum(Quantity) as Total_pizza_sold                --    BOTTOM 5 SELLING BY QUANTITY
FROM pizza_sales
GROUP BY  pizza_name
ORDER BY Total_pizza_sold 
limit 5;


SELECT
pizza_name,
count(distinct order_id) as Total_orders                 --      TOP 5 SELLING BY ORDERS
FROM pizza_sales
GROUP BY  pizza_name
ORDER BY Total_orders desc
limit 5;

SELECT
pizza_name,
count(distinct order_id) as Total_orders                 --      BOTTOM 5 SELLING BY ORDERS
FROM pizza_sales
GROUP BY  pizza_name
ORDER BY Total_orders   
limit 5;
