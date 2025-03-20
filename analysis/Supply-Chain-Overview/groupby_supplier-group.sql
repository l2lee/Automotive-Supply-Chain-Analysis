with temp as (
    select
        region
       , maker
       , model_year
       , supplier
       , case when s.parent_company is not null then s.parent_company else g.supplier end as supplier_group
       , product
       , yearly_volume
    from
        combined_preprocessed g
    left join supplier s on g.supplier = s.supplier_name
)
, temp2 as (
    select
        product
        , case
            WHEN model_year BETWEEN 2005 AND 2010 THEN '2005-2010'
            WHEN model_year BETWEEN 2011 AND 2015 THEN '2011-2015'
            WHEN model_year BETWEEN 2016 AND 2020 THEN '2016-2020'
            ELSE '2021-2025'
        END AS year_range
        , supplier_group
        , sum(yearly_volume) as total_volume
    from temp
    group by
        product
        , case
            WHEN model_year BETWEEN 2005 AND 2010 THEN '2005-2010'
            WHEN model_year BETWEEN 2011 AND 2015 THEN '2011-2015'
            WHEN model_year BETWEEN 2016 AND 2020 THEN '2016-2020'
            ELSE '2021-2025'
        END
        , supplier_group
)
, temp3 as (
    select
        product
        , year_range
        , supplier_group
        , total_volume
        , row_number() over (partition by product, year_range order by total_volume desc) as rank
    from temp2
    order by
        product
        , year_range
)

select
    product
    , year_range
    , supplier_group
    , total_volume
from temp3
where rank <= 5
order by
    product
    , year_range

