with dummy_cte as (
    select 1 as foo
)

select
    cast(null as {{dbt_utils.type_int()}}) as plant_id,
    cast(null as {{dbt_utils.type_int()}}) as entr_tag_id,
    cast(null as {{dbt_utils.type_timestamp()}}) as date_time,
    cast(null as {{dbt_utils.type_numeric()}}) as tag_value,
    cast(null as {{dbt_utils.type_numeric()}}) as interval_s,
    cast(null as {{dbt_utils.type_string()}}) as value_type,
    cast(null as {{dbt_utils.type_string()}}) as value_units
from dummy_cte
where 1=0
