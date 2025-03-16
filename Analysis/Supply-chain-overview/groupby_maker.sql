with temp1 as (
    select
        region
        , maker
        , model_year
        , supplier
        , product
        , sum(yearly_volume) as total_volume
    from combined_preprocessed
    group by
        region
        , maker
        , model_year
        , supplier
        , product
)
, temp2 as (
    select
        region
       , maker
       , model_year
       , supplier
       , case when s.parent_company is not null then s.parent_company else t.supplier end as supplier_group
       , product
       , total_volume
    from
        temp1 t
    left join supplier s on t.supplier = s.supplier_name
)

select
    maker
    , case
         WHEN model_year BETWEEN 2005 AND 2010 THEN '2005-2010'
         WHEN model_year BETWEEN 2011 AND 2015 THEN '2011-2015'
         WHEN model_year BETWEEN 2016 AND 2020 THEN '2016-2020'
         ELSE '2021-2025'
      END AS year_range
    , supplier_group
    , product
    , count(*) as trade_year_cnt
    , sum(total_volume) as total_volume
from temp2
group by
    maker
    , case
         WHEN model_year BETWEEN 2005 AND 2010 THEN '2005-2010'
         WHEN model_year BETWEEN 2011 AND 2015 THEN '2011-2015'
         WHEN model_year BETWEEN 2016 AND 2020 THEN '2016-2020'
         ELSE '2021-2025'
      END
    , supplier_group
    , product
order by
    maker
    , year_range
    , supplier_group