CREATE DATABASE sales_analytics ;
USE sales_analytics;

select * from sales_data limit 20;

-- What is the total sales and total profit of the business?

select
 round(sum(sales),2) as total_sales,
 round(sum(profit),2) as total_profit 
from sales_data ;


-- How do sales and profit vary over time (year-wise or month-wise)?

-- year wise
select
order_year,
round(sum(sales), 2) as total_sales,
round(sum(profit), 2) as total_profit
from sales_data
group by  order_year
order by order_year;

-- month wise 
select
order_year,
order_month,
round(sum(sales), 2) as total_sales,
round(sum(profit), 2) as total_profit
from sales_data
group by order_year, order_month
order by order_year, order_month;

-- Which category and sub-category are most and least profitable?

-- category
SELECT 
    category,
    ROUND(SUM(profit), 2) AS total_profit
FROM sales_data
GROUP BY category
ORDER BY total_profit DESC;

-- subcategory
SELECT 
    `sub-category`,
    ROUND(SUM(profit), 2) AS total_profit
FROM sales_data
GROUP BY `sub-category`
ORDER BY total_profit DESC;

-- Which region generates the highest and lowest profit?

select 
region,
round(sum(profit), 2) as total_profit
from sales_data
group by region
order by total_profit desc;

-- How does discount impact profit?

SELECT 
    discount,
    ROUND(AVG(profit), 2) AS avg_profit,
    ROUND(SUM(profit), 2) AS total_profit
FROM sales_data
GROUP BY discount
ORDER BY discount;

-- Which products have high sales but low or negative profit?

/*select
product_name, 
round(sum(sales), 2) as total_sales,
round(sum(profit), 2) as total_profit
from sales_data
group by product_name
order by total_sales desc, total_profit asc;

select
product_name, 
round(sum(sales), 2) as total_sales,
round(sum(profit), 2) as total_profit
from sales_data
group by product_name
order by total_profit asc;*/

SELECT
    product_name,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM sales_data
GROUP BY product_name
HAVING total_sales > 10000 AND total_profit <= 0
ORDER BY total_sales DESC;
