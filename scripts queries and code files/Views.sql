use  defacto
select * 
from products
-- returns all products and how much they got bought in terms of quantity
create or alter view products_bought as 
select oi.prod_id , p.prod_name,
      sum (oi.quantity ) as total_bought
from order_items oi
left join  products as p
on oi.prod_id=p.prod_id 
group by oi.prod_id , p.prod_name 

select * from products_bought

--Total amount of sold merch per payment method
create or alter view GMV_view as 
 select payment_method,
      sum(order_value) ov
	  from orders
	  group by  rollup(payment_method)

select * from gmv_view

--Revenue earned by the business from every user
create view revenue_per_user as
select 
     u.user_id,u.user_name,
	 sum(order_value) revenue
	 from orders o
	 left join users u
	 on o.user_id =u.user_id 
	 group by u.user_id,u.user_name 

select * from revenue_per_user

--AOV for all orders
create view average_order_value as 
select 
     AVG(order_value) AOV
	 from orders o
	 join users u
	 on o.user_id=u.user_id 

select * from average_order_value
