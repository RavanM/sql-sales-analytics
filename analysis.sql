--Which region brings in the most revenue?
select r.region_name,
Sum(s.total_amount) AS total_revenue
from Sales s
JOIN Orders o ON s.order_id = o.order_id
join Regions r on o.region_id = r.region_id
GROUP by r.region_name
Order by total_revenue Desc;


--Who are the customers who bring in the most money?
select c.full_name,
Sum(s.total_amount) as total_spent
from Sales s
join Orders o on s.order_id = o.order_id
join Customers c on c.customer_id = o.customer_id
group by c.full_name
order by total_spent desc;


--Which products sell the most and generate the most revenue?
select p.product_name,
sum(s.total_amount) as total_revenue,
sum(s.quantity) as total_units_sold
from Sales s
join Products p on p.product_id = s.product_id
group by p.product_name
order by total_revenue desc;


--How much have you sold each month? What is the trend?
select 
FORMAT(o.order_date, 'yyyy-MM') as month,
Sum(s.total_amount) as monthly_revenue
from Sales s
join Orders o on s.order_id = o.order_id
group by FORMAT(o.order_date, 'yyyy-MM')
order by month



--How many orders have you had per region and what is the revenue?
select r.region_name,
sum(s.total_amount) as total_revenue,
COUNT( o.order_id) as total_orders
from Sales s
join Orders o on s.order_id = o.order_id
join Regions r on o.region_id = r.region_id
group by r.region_name
order by total_revenue desc