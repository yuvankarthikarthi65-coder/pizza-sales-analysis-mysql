select* from pizza_sales1;
A. KPI's

1. Total Revenue:

select sum(total_price) as Total_revenue from pizza_sales1;

2. Average Order Value

select (sum(total_price) / count(distinct order_id) ) as Avg_order_value
from pizza_sales1;

3. Total Pizzas Sold

SELECT SUM(quantity) AS Total_pizza_sold FROM pizza_sales1;

4. Total Orders

SELECT COUNT(DISTINCT order_id) AS Total_Orders FROM pizza_sales1;

5. Average Pizzas Per Order

SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) /
CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2))
AS Avg_Pizzas_per_order
FROM pizza_sales1;

B.Daily Trend for Total Orders

SELECT
    order_date,
    COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales1
GROUP BY order_date
ORDER BY order_date;

C. Monthly Trend for Orders

SELECT
    MONTH(order_date) AS month_number,
    COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales1
GROUP BY MONTH(order_date)
ORDER BY MONTH(order_date);

D. % of Sales by Pizza Category

SELECT pizza_category, CAST(SUM(total_price) AS DECIMAL(10,2)) as
total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales1)
AS DECIMAL(10,2)) AS PCT
FROM pizza_sales1
GROUP BY pizza_category

E. % of Sales by Pizza Size

SELECT pizza_size, CAST(SUM(total_price) AS DECIMAL(10,2)) as
total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales)
AS DECIMAL(10,2)) AS PCT
FROM pizza_sales1
GROUP BY pizza_size
ORDER BY pizza_size

F. Total Pizzas Sold by Pizza Category

SELECT
    pizza_category,
    SUM(quantity) AS total_pizzas_sold
FROM pizza_sales1
GROUP BY pizza_category
ORDER BY total_pizzas_sold DESC;

G. Top 5 Pizzas by Revenue

SELECT
    pizza_name,
    ROUND(SUM(total_price), 2) AS total_revenue
FROM pizza_sales1
GROUP BY pizza_name
ORDER BY total_revenue DESC
LIMIT 5;

H. Bottom 5 Pizzas by Revenue

SELECT
    pizza_name,
    ROUND(SUM(total_price), 2) AS total_revenue
FROM pizza_sales1
GROUP BY pizza_name
ORDER BY total_revenue ASC
LIMIT 5;

I. Top 5 Pizzas by Quantity

SELECT
    pizza_name,
    SUM(quantity) AS total_quantity_sold
FROM pizza_sales1
GROUP BY pizza_name
ORDER BY total_quantity_sold DESC
LIMIT 5;

J. Bottom 5 Pizzas by Quantity

SELECT
    pizza_name,
    SUM(quantity) AS total_quantity_sold
FROM pizza_sales1
GROUP BY pizza_name
ORDER BY total_quantity_sold ASC
LIMIT 5;

K. Top 5 Pizzas by Total Orders

SELECT
    pizza_name,
    COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales1
GROUP BY pizza_name
ORDER BY total_orders DESC
LIMIT 5;

L. Borrom 5 Pizzas by Total Orders

SELECT  pizza_name, COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales1
GROUP BY pizza_name
ORDER BY total_orders ASC
LIMIT 5;


