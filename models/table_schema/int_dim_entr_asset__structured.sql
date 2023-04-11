with dummy_cte as (
    select 1 as foo
)

select
    cast(null as {{dbt.type_int()}}) as asset_id,
    cast(null as {{dbt.type_string()}}) as asset_type,
    cast(null as {{dbt.type_string()}}) as asset_name
from dummy_cte
where 1=0
