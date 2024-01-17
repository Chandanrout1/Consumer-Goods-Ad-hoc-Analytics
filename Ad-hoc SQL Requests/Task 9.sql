with channel_pct as 
	(select 
		c.channel,
        sum(s.sold_quantity * g.gross_price) as total_sales
	 from
  fact_sales_monthly s 
  join fact_gross_price g on s.product_code = g.product_code
  join dim_customer c on s.customer_code = c.customer_code
  where s.fiscal_year= 2021
  group by c.channel
  order by total_sales desc
)
select
  channel,
  round(total_sales/1000000,2) as gross_sales_in_millions,
  round(total_sales/(sum(total_sales) over())*100,2) as percentage 
from channel_pct ;