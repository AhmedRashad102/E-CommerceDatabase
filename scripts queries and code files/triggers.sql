
create or alter trigger cart_reduce
on cart_items
after delete
as
begin
	declare @i int,@u int
	select @i=items_value,@u = user_id from deleted
	update cart
	set total_value=total_value-@i
	where @u = user_id
	select 'cart_reduce ok'
end

/* (select prod_id from products where prod_id = @p) is null or (select user_id from users where user_id = @u) is null or*/
create or alter trigger cart_update
on cart_items
after insert
as
begin
	declare @u int,@p int, @q int, @price int
	select @q=quantity,@u=user_id,@p=prod_id from inserted
	if @q = 0
	begin
		select 'invalid operation'
		delete from cart_items
		where @p=prod_id and @u=user_id
		return
	end
	select @price=price from products
	where @p=prod_id
	update cart_items
	set price_per_unit=@price
	where @p=prod_id and @u = user_id
	update cart
	set total_value = (select sum(items_value) from cart_items where user_id=@u group by user_id)
	select 'OK'
end

create or alter trigger user_deletion
on users
instead of delete
as
begin
	declare @u int
	select @u=user_id from deleted
	delete from cart_items
	where user_id=@u
	delete from cart
	where user_id=@u
	delete from product_reviews
	where user_id = @u
	select 'User Deletion Completed'
end

create or alter trigger product_deletion
on products
instead of delete
as
begin
	declare @u int
	select @u=prod_id from deleted
	delete from cart_items
	where prod_id=@u
	delete from order_items
	where prod_id=@u
	delete from prod_images
	where prod_id=@u
	delete from prod_size
	where prod_id=@u
	delete from product_reviews
	where prod_id=@u
	select 'Product Deletion Completed'
end

