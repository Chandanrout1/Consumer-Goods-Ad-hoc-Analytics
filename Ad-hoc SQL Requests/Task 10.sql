with product_div as 
	(select p.division,
			f.product_code,
            p.product,
            sum(f.sold_quantity) as total_sold_quantity,
            rank() over(partition by p.division order by sum(f.sold_quantity) desc) as "rank_order"
	 from dim_product p
     join fact_sales_monthly f
     on p.product_code = f.product_code
     where f.fiscal_year = 2021
     group by  p.division,f.product_code,p.product)
select 
	*
from product_div
where rank_order in (1,2,3) 
order by division, rank_order;