
with brand_name
as
(
	select p.brand,sum(p.price) as total,avg(p.price) as avgg,count(o.order_id) as countt
	from products p join order_items oi 
	on p.prod_id=oi.prod_id join orders o
	on oi.order_id=o.order_id
	group by p.brand
)
select * from (select 'Total' as point,  brand, total as value from brand_name
				union all
			   select 'Average' as point, brand,avgg as value from brand_name
				union all
			   select  'Num of Order' as point,brand,countt as value from brand_name
) as da
pivot (
    sum(value)  
    for brand in (
        [Hollister], [Converse], [Tommy Hilfiger], [Defacto], [Nike],
        [Forever 21], [Levi's], [ASOS], [Under Armour],
        [Gap], [Vans], [Abercrombie & Fitch], [Calvin Klein],
        [Steve Madden], [Adidas], [Michael Kors], [Coach], 
        [Topshop], [Urban Outfitters],  [Puma], [Zara]
    )
) as PTable;



