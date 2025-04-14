/*======================================================================== Procedures ========================================================================*/
-- Delete User
create or alter proc user_delete(@u int)
as
begin
	delete from users
	where user_id = @u
end
-- Removes all cart items
create or alter proc empty_cart(@u int)
as
begin
	delete from cart_items
	where user_id = @u
end
-- Places an order in the system
create or alter proc order_placement(@u int,@pi int ,@pm varchar(30),@sf int)
as
begin
	declare @t table(i int, j int, k int, l int)
	insert into @t(i,j,k,l)
	select user_id,prod_id,price_per_unit, quantity from cart_items where user_id = @u
	declare @i int
	declare @ov int
	select @ov=total_value from cart where user_id = @u
	insert into orders(user_id,payment_id,payment_method,ship_fees,order_value,order_date)
	select @u,@pi,@pm,@sf,@ov + @sf,getdate()
	select @i = order_id from orders
	insert into order_items(order_id,prod_id,price_per_unit,quantity)
	select @i,j,k,l from @t
	delete from cart_items
	where user_id = @u
	update cart
	set total_value = 0
	where user_id = @u
end
