use defacto
go


create rule phone_num
as
LEN(@val) = 10 AND @val NOT LIKE '%[^0-9]%';

EXEC sp_bindrule 'phone_num'  ,'user_pn.phone_number'

---------------------------------
create rule dis 
as
@d between 0.00 and 1.00 

create default d as 0


EXEC sp_bindrule 'dis','products.discount'
EXEC sp_bindefault 'd' ,'products.discount'

EXEC sp_unbindefault 'd' ,'products.discount'

insert into products(prod_name,posting_date,price)
values('Function-based upward-trending utilisation','2024-12-16',1474)

-----------------------------------------------------------------
create rule Tag
as
@t in('underwear','formal','sportswear','casual')

create default t1 as 'casual' 


EXEC sp_bindrule 'Tag','products.tags'
EXEC sp_bindefault't1','products.tags'


insert into products(prod_name,posting_date,price)
values('Function-based upward-trending utilisation','2024-12-16',1474)


------------------------------------------
create rule type_n
as
@typ in('bottoms','outerwear','tops')

EXEC sp_bindrule 'type_n','products.type'

insert into products(prod_name,posting_date,price,type)
values('Function-based upward-trending utilisation','2024-12-16',1474,'bottoms')

------------------------------------------------
create rule dep
as
@depa in('woman','men','kids')

create default dep as 'men' 


EXEC sp_bindrule 'Tag','products.dep'
EXEC sp_bindefault'dep','products.dep'

insert into products(prod_name,posting_date,price,dep)
values('Function-based upward-trending utilisation','2024-12-16',1474,'woman')

---------------------------------------------------
create rule ses
as
@sesa in('summer','fall','winter','spring')

EXEC sp_bindrule 'ses','products.season'

insert into products(prod_name,posting_date,price,season)
values('Function-based upward-trending utilisation','2024-12-16',1474,'fall')
---------------------------------


