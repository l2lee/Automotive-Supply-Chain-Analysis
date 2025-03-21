--Average Maker Amount
select
    coalesce(parent_company,name) as supplier,
    sum(maker_num) / count(distinct model_year) as avg_maker_amount
    from (
select distinct model_year, c.supplier, count(distinct maker) as maker_num from component_fact c
group by model_year, supplier
order by model_year, supplier) c
left join supplier s on c.supplier = s.name
group by coalesce(parent_company,name)
order by avg_maker_amount desc
limit 10



