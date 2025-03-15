with base as
    (select
         replace(region, 'ASEAN?India?Korea', 'ASEAN, India, Korea') as region
        , maker
        , model
        , case
            when right(model, 1) = ')'
            then replace(replace(replace(replace(replace(
                    regexp_replace(regexp_replace(split_part(model, '(', -1), '[^A-Za-z ]', '', 'g'), 'for ', '', 'i')
                , 'Export to China as Tivolan', 'China')
                , 'UK', 'United Kingdom')
                , 'Korea', 'South Korea')
                , 'USA', 'United States')
                , 'Turkiye', 'Turkey')
            else null
            end as model_region
        , substring(model_year, 1, 4)::int as model_year
        , supplier
        , product
        , volume
    from combined
    where
        region is not null
)
, base_country as (
    select
        region
       , maker
       , model
       , case when
           c.nicename is not null
           or b.model_region = 'Europe'
           or b.model_region = 'North America'
           then b.model_region
         else 'Unknown' end as model_region
       , model_year
       , supplier
       , case when s.parent_company is not null then s.parent_company else b.supplier end as supplier_group
       , product
       , volume
    from
        base b
    left join country c on b.model_region = c.nicename
    left join supplier s on b.supplier = s.supplier_name
)

-- group by maker
select
    region
    , maker
    , model_year as supply_year
    , supplier_group
    , product
    , sum(volume) as yearly_volume
from base_country
group by
    region
    , maker
    , model_year
    , supplier_group
    , product
order by region, maker, model_year