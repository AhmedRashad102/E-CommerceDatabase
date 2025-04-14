use defacto
go



create or alter function get_order_of_date(@sd date,@ed date)
returns @da table (co int,br varchar(20)) 
as 
begin
	insert into @da
	select count(oi.order_id) ,p.brand
	from orders o join order_items oi 
	on o.order_id=oi.order_id 
	join products p 
	on oi.prod_id=p.prod_id
	where o.order_date between @sd and @ed
	group by p.brand
	order by count(oi.order_id) desc
	return
end

select * from get_order_of_date('2024-01-01','2024-06-30')




------------------------------------------------------------------------------------------------------------------------------------
create or alter function get_last_5(@u int) 
returns @t table(user_id int, month int, avg_order_value int)
as
begin
	insert into @t
	select user_id,month(order_date)  ,avg(order_value) from orders
	where year(order_date) = year(getdate())  and user_id = @u
	group by user_id,month(order_date)
	return
end

select * from get_last_5(445)






