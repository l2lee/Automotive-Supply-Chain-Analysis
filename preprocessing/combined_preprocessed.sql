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
       , product
       , volume
    from
        base b
    left join country c on b.model_region = c.nicename
)

-- group by model
select
    region
    , maker
    , model
    , model_region
    , model_year
    , supplier
    , product
    , sum(volume) as yearly_volume
from base_country
group by
    region
    , maker
    , model
    , model_region
    , model_year
    , supplier
    , product
order by region, maker, model_year