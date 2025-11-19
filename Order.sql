
-- Q1. what the total sum of the price
select sum(total_price) as Total_Revenue 
from pizza;


-- Q2.Average amount spend per order 
select sum(total_price) / count(distinct order_id) as Avg_Order 
from pizza;


-- Q3.total sum of pizza's quantity
select sum(quantity) as Total_Pizza_Sold 
from pizza;

-- Q4. calculated total orders
select count(distinct order_id) as  Total_orders from pizza;

-- Q5. Average pizzas per order
select sum(quantity) / count(distinct order_id);


-- Q6.Daily trend orders 
select dayname(order_date) as order_day , 
count(distinct order_id) as Total_orders
from pizza
group by dayname(order_date);


-- Q7.Hourly trend orders
select hour(order_time) as order_hours , 
count(distinct order_id) as Total_orders 
from pizza
group by hour(order_time)
order by hour(order_time);



-- Q8.Calculate total number of pizzas and their percentage based on catgory
select pizza_category,
 count(pizza_id) as total_pizzas ,
sum(total_price)*100/(select sum(total_price) from pizza) as percentage
from pizza
group by pizza_category;



-- Q9.Calculate Total sales amount and their percentages based on pizza size
select pizza_size , sum(total_price) as Total_sales,
sum(total_price)*100/(select sum(total_price) from pizza) as percentage
from pizza
group by pizza_size;


-- Q10. calculate total quantity of pizza by category
select pizza_category , sum(quantity) as Total_Pizzas_Sold
from pizza
group by pizza_category;


-- Q11.calculate total pizzas sold for each pizza on a specific month
select pizza_name ,sum(quantity) as Total_pizzas_Sold
from pizza
where month(order_date) = 8
group by pizza_name
order by sum(quantity) desc
limit 5;





