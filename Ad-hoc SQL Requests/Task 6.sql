select 
	c.customer_code,
    c.customer,
    round(avg(p.pre_invoice_discount_pct)*100,2) as avg_discount_pct
from dim_customer c
join fact_pre_invoice_deductions p
on c.customer_code = p.customer_code
where c.market = "India"
and p.fiscal_year = 2021
group by c.customer_code,c.customer
order by avg_discount_pct desc
limit 5;