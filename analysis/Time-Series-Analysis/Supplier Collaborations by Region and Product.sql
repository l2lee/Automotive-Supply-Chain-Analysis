--Supplier Collaborations by Region and Product
select distinct parent_company, region, model_region, product from component_fact c
left join supplier s on c.supplier = s.name
where  parent_company in ('Faurecia','FinDreams') and model_year = 2025
order by parent_company;