--Top 3 suppliers in each product category
with p_rank as (
select
    model_year,
    coalesce(s.parent_company,s.name) as supplier_name,
    product,
    rank() over(partition by model_year, product order by sum(unit) desc) as supplier_rank,
    sum(unit) as unit
from component_fact c
left join supplier s on c.supplier = s.name
group by model_year,supplier_name, product
order by model_year desc, product, supplier_rank)
select supplier_name, count(*) as high_rank_count,
       array_agg(model_year ||':'|| product order by model_year) as high_rank_products
from (select distinct supplier_name, model_year, product  from p_rank where supplier_rank<=3) p
group by supplier_name
order by high_rank_count desc;
