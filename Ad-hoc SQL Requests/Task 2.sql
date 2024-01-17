with unique_products_2020 as 
	(select count(distinct product_code) as unique_products_2020
	from fact_sales_monthly
	where fiscal_year = 2020),
unique_products_2021 as 
	(select count(distinct product_code) as unique_products_2021
    from fact_sales_monthly
    where fiscal_year = 2021)
select 
	unique_products_2020.unique_products_2020,
    unique_products_2021.unique_products_2021,
    round(((unique_products_2021.unique_products_2021 - unique_products_2020.unique_products_2020)
		/ unique_products_2020.unique_products_2020)*100,2) as percentage_chg
from  unique_products_2020,unique_products_2021;


