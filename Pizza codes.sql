create database pizza_hut;

create table orders(
order_id int not null,
order_date date not null,
order_time time not null,
primary key(order_id));

create table order_details(
order_details_id int not null,
order_id int not null,
pizza_id text not null,
quantity int not null,
primary key(order_details_id));


-- 1) Retrieve the total number of orders placed.

select count(order_id) as total_orders
from orders;

-- 2) Calculate the total revenue generated from pizza sales.

select 
round(sum((order_details.quantity*pizzas.price)),2) as total_revenue
from order_details 
join 
pizzas on
order_details.pizza_id=pizzas.pizza_id;

-- 3)Identify the highest-priced pizza.

select pizza_types.name,pizzas.price 
from pizza_types 
join pizzas
on pizza_types.pizza_type_id=pizzas.pizza_type_id
order by 2 desc
limit 1;

-- 4) Identify the most common pizza size ordered.

select pizzas.size,count(order_details.order_details_id) as order_count
from pizzas
join order_details
on order_details.pizza_id=pizzas.pizza_id
group by pizzas.size
order by 2 desc
limit 1;

-- 5) List the top 5 most ordered pizza types along with their quantities.

select pizza_types.`name` ,sum(order_details.quantity) as total_quantity
from order_details
join pizzas 
on order_details.pizza_id=pizzas.pizza_id
join pizza_types on pizzas.pizza_type_id=pizza_types.pizza_type_id
group by pizza_types.name
order by 2 desc
limit 5;

-- alternative
select pizzas.pizza_type_id ,sum(order_details.quantity) as total_quantity
from order_details
join pizzas 
on order_details.pizza_id=pizzas.pizza_id
group by pizzas.pizza_type_id
order by 2 desc
limit 5;

-- 6) Join the necessary tables to find the total quantity of each pizza category ordered.

select pizza_types.category ,sum(order_details.quantity) as total_quantity
from order_details 
join pizzas
on order_details.pizza_id=pizzas.pizza_id
join pizza_types
on pizzas.pizza_type_id=pizza_types.pizza_type_id
group by pizza_types.category
order by total_quantity desc;

-- 7) Determine the distribution of orders by hour of the day.

select hour(order_time) as order_time,count(order_id) as order_count
from orders
group by hour(order_time);

-- 8) Join relevant tables to find the category-wise distribution of pizzas.

select pizza_types.category,sum(order_details.quantity) as distribution_of_pizzas
from pizza_types
join pizzas
on pizza_types.pizza_type_id=pizzas.pizza_type_id
join order_details
on order_details.pizza_id=pizzas.pizza_id
group by pizza_types.category;

-- alternate

select category,count(name)
from pizza_types
group by category;

-- 9) Group the orders by date and calculate the average number of pizzas ordered per day.

select
 round(avg(total_quan),0)as avg_num_of_pizzas_ordered from
(
select 
orders.order_date,sum(order_details.quantity) as total_quan
from orders 
join order_details
on orders.order_id=order_details.order_id
group by orders.order_date
) as avg_daily_orders;

-- 10) Determine the top 3 most ordered pizza types based on revenue.
 
 select  pizza_types.name,sum((order_details.quantity*pizzas.price))as revenue 
 from order_details
 join pizzas 
 on order_details.pizza_id=pizzas.pizza_id
 join pizza_types
 on pizza_types.pizza_type_id=pizzas.pizza_type_id
 group by pizza_types.name
 order by revenue desc
 limit 3;

-- 11 ) Calculate the percentage contribution of each pizza type to total revenue.

select  pizza_types.category,round(sum((order_details.quantity*pizzas.price)),2)as revenue,
round((sum(order_details.quantity*pizzas.price)*100)/
(select sum(order_details.quantity*pizzas.price)
from order_details
join pizzas 
on order_details.pizza_id=pizzas.pizza_id
),2) as rev_avg
 from order_details
 join pizzas 
 on order_details.pizza_id=pizzas.pizza_id
 join pizza_types
 on pizza_types.pizza_type_id=pizzas.pizza_type_id
 group by pizza_types.category
 order by rev_avg desc;

-- 12 )Analyze the cumulative revenue generated over time.

select order_date, rev, round(sum(rev) over(order by order_date),1) as cum_rev
from
(
select orders.order_date,round(sum(order_details.quantity*pizzas.price),1) as rev
from orders
join order_details 
on 
orders.order_id=order_details.order_id
join pizzas 
on order_details.pizza_id=pizzas.pizza_id
group by orders.order_date
) as cum;

-- 13)Determine the top 3 most ordered pizza types based on revenue for each pizza category.

select category as pizza_category,name as pizza_type, revenue,denserank as top_3 from 
(
select pizza_types.category,pizza_types.name, round(sum(order_details.quantity*pizzas.price),0) as revenue,
dense_rank() over(partition by category order by sum(order_details.quantity*pizzas.price) desc) as denserank
from order_details
join pizzas
on order_details.pizza_id=pizzas.pizza_id
join pizza_types
on pizza_types.pizza_type_id=pizzas.pizza_type_id
group by category,name
order by revenue desc
) as new_table
where denserank<=3
order by pizza_category,top_3 asc;







































































































