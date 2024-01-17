with pc_2020 as 

( select 
	p.segment,
    count(distinct f.product_code) as product_count_2020
from dim_product p
join fact_sales_monthly f
on p.product_code = f.product_code
where f.fiscal_year = 2020
group by p.segment),

pc_2021 as 

( select 
	p.segment,
    count(distinct f.product_code) as product_count_2021
from dim_product p
join fact_sales_monthly f
on p.product_code = f.product_code
where f.fiscal_year = 2021
group by p.segment)

select 
	pc_2020.segment ,
    product_count_2020,
    product_count_2021,
    (pc_2021.product_count_2021 - pc_2020.product_count_2020) as difference
from pc_2020 
join pc_2021 
on pc_2020.segment = pc_2021.segment
order by difference desc;



