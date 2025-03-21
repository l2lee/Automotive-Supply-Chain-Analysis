--Case Study
select model_year,c.region, maker_group,product,
       case
           when cn.region in ('W. Europe','C&E. Europe') then 'Europe'
           when cn.region in ('N. America','S. America') then 'Americas'
           when cn.region in ('India','South Korea','ASEAN') then 'ASEAN, India, Korea'
           when cn.region is not null then cn.region
       else model_region end as model_region,unit,
       count(*)over(partition by model_year) as count,
       sum(unit)over(partition by model_year) as yearly_unit,
       unit / sum(unit)over(partition by model_year) as share
from component_fact c
left join supplier s on c.supplier = s.name
left join maker m on c.maker = m.name and c.model_year = m.year
left join country cn on c.model_region = cn.nicename
where parent_company in ('Bosch','ZF')
group by model_year,c.region, maker_group, product,
         case
           when cn.region in ('W. Europe','C&E. Europe') then 'Europe'
           when cn.region in ('N. America','S. America') then 'Americas'
           when cn.region in ('India','South Korea','ASEAN') then 'ASEAN, India, Korea'
           when cn.region is not null then cn.region
       else model_region end ,unit
order by model_year, product;