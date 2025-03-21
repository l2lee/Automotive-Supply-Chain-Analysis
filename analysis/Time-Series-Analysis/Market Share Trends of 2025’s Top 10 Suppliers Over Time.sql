--Market Share Trends of 2025’s Top 10 Suppliers Over Time
with s_rank as (
select
    model_year,
    coalesce(s.parent_company,s.name) as supplier_name,
    rank() over(partition by model_year order by sum(unit) desc) as supplier_rank,
    sum(unit) as unit
from component_fact c
left join supplier s on c.supplier = s.name
group by model_year,supplier_name),
s_share as (
select
    r1.model_year,
    r1.supplier_name,
    r1.supplier_rank,
    r1.unit,
    sum(r1.unit) over(partition by r1.model_year) as unit_year,
    concat(round(cast(r1.unit / sum(r1.unit) over(partition by r1.model_year)*100 as numeric),2),'%') as share,
    case
        when r1.model_year = 2025 then concat(round(cast((r1.unit*12/3 - r2.unit) / r2.unit as numeric)*100,2),'%')
    else concat(round(cast((r1.unit - r2.unit) / r2.unit as numeric)*100,2),'%')
    end as yoy
from s_rank r1
left join s_rank r2 on r1.model_year = r2.model_year+1 and r1.supplier_name = r2.supplier_name)
select model_year, supplier_name, supplier_rank,share ,
       case
           when yoy='%' then null
           else yoy
       end as yoy
from s_share
where
    supplier_name in
     (select distinct supplier_name from s_rank
        where supplier_rank <= 10 and model_year = 2025)
order by model_year,supplier_rank;