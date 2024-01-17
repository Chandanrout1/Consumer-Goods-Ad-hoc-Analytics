select 
	monthname(s.date) as Month,
    s.fiscal_year as year,
    round(sum(g.gross_price * sold_quantity)/1000000,2) as Gross_sales_amount
from fact_sales_monthly s
join fact_gross_price g using (product_code)
join dim_customer d using (customer_code)
where d.customer = "Atliq Exclusive"
group by monthname(s.date),s.fiscal_year
order by s.fiscal_year 

