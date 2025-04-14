use defacto


select top(10) p.prod_name , sum (it.quantity) as tot_q
from order_items it join products p 
on p.prod_id = it.order_id
group by p.prod_name 
order by tot_q desc
--------------------- اكتر المنتجات مبعيا

select  p.prod_name ,
count(p.prod_id)  as times_sold 
,sum (oi.quantity) as tot_quantity
from  order_items oi join products p
on oi.order_id = p.prod_id
group by p.prod_name
order by tot_quantity desc

--------------------عاوز اعمل عروض للزباين اللى اشتروا منى الفترة الاخيرة 

select u.user_id , u.user_name, max (o.order_date) as last_time 
from users u join  orders o 
on u.user_id = o.user_id
where o.order_date between '2024-12-30' AND '2025-04-03'
group by u.user_name , u.user_id
order by last_time desc 

-------------متوسط المبلغ اللى الناس بتصرفه فى كل اوردر

select avg (o.order_value) as gg
from  orders o 
where o.order_date between '2023-01-01' AND '2023-12-31'

------------الناس ال vip

select u.user_name,count (o.order_id) as order_count ,     --- عدد الاوردارات اللى عملها 
 sum (o.order_value) as tot_spent              ---اجمالى المبلغ اللى صرفه العميل 
 from  users u join orders o 
on u.user_id = o.user_id
group by u.user_name
order by tot_spent

---------------- عاوز اعرف عدد طلبات اليوم 

select  count (*) as today_order
from orders o 
where o.order_date = getdate()

------------ عاوز اعرف الناس اللى عملوا تقيمات  
select   u.user_name , count (pr.prod_id) as reviwes
from users u  inner join product_reviews pr
on u.user_id = pr.user_id
group by u.user_name



------------- عاوز احسب ايه هيا اكتر ولاية اشترت منى 
select us.state , sum (o.order_id) as tot
from user_address us join users u on us.user_id = u.user_id 
            join orders o on u.user_id = o.user_id 
group by us.state
order by tot desc



----------- عاوز اعرف ايه هيا اكتر فئة عمرية اشترت منى 


select top 10 o.order_id,u.user_name , u.Age
from users u , orders o
where u.user_id = o.user_id
group by order_id ,u.user_name,u.Age



				








