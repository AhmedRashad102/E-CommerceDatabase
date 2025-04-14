use defacto
go 




--Top 25 users in terms of: Order volume (no of orders), GMV (top sum of order values per user).
select top 25 count(order_id) as count_of_order,sum(order_value) sum_of_order
from orders


--Number of payment methods used -> percentages.
select count(payment_id)*100/(select count(payment_id) from orders) as precentage
from orders
where payment_method='wallet'


--Conversion Rate: number of users placed at least one order /all users in the database.
select  (count(o.user_id))  / (count(u.user_id)) 
from orders o join users u 
on o.user_id = u.user_id


--Number of products based on types

select type, count(prod_name) as count_of_products
from products
group by type

-- Product name and 
select * 
from (select distinct p.prod_name, p.brand,sum(p.price) over (partition by prod_name ,brand) as running_sum
from products p where brand is not null) as cu
order by cu.brand,cu.running_sum



select  o.payment_id, o.payment_method,DENSE_RANK() over(partition by payment_method order by payment_id ) as Dense_ran
from orders o

select  o.payment_id, o.payment_method,RANK() over(partition by payment_method order by payment_id ) as Dense_ran
from orders o


select  p.brand, p.prod_name,Row_number() over(partition by prod_name order by p.brand) as row_Num
from products p


select p.prod_name,lag(ci.price_per_unit)over( order by quantity) as Lag_brand,lead(ci.price_per_unit)over(  order by quantity) as Lead_brand
from cart_items ci  join products p on ci.prod_id=p.prod_id
order by ci.price_per_unit,p.brand


select * 
from (select p.prod_name,p.brand,NTILE(7) over(order by p.prod_name) as nt
from products p) as col
order by col.prod_name,col.nt



with table_t as (
select user_id,payment_method, count(
case
	when payment_method = 'cash' then '1'
	else null
	end
) cash ,count(
case
	when payment_method = 'credit' then '1'
	else null
	end
) credit,
count(case
	when payment_method = 'wallet' then '1'
	else null
	end
) wallet
from orders
group by USER_id, payment_method)

select USER_ID ,
	case
		when cash>credit and cash>wallet then 'cash'
		when credit>cash and credit>wallet then 'credit'
		else 'wallet'
	end as majority
from table_t


	select user_id,month(order_date) from orders
	where year(order_date) = year(getdate())
	order by 1
