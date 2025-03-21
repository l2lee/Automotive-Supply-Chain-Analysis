--Component Competition
with competition as (
select distinct model_year, product,
                count(supplier) over(partition by model_year, product) as company_total
from (select distinct  model_year, product, supplier from component_fact
        group by model_year, product, supplier) c
group by model_year, product,supplier
order by model_year)
select distinct product, avg, cast(rank()over(order by avg desc) as integer) as rank from
(select distinct product, avg(company_total) over(partition by product) as avg from competition) as rank
order by rank





