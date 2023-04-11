with dummy_cte as (
    select 1 as foo
)

select
    cast(null as {{dbt.type_int()}}) as entr_tag_id,
    cast(null as {{dbt.type_string()}}) as entr_tag_name,
    cast(null as {{dbt.type_string()}}) as logical_node,
    cast(null as {{dbt.type_string()}}) as sensor_name,
    cast(null as {{dbt.type_string()}}) as presentation_name,
    cast(null as {{dbt.type_string()}}) as standard_units,
    cast(null as {{dbt.type_string()}}) as value_type,
    cast(null as {{dbt.type_string()}}) as data_type,
    cast(null as {{dbt.type_string()}}) as collector_type
from dummy_cte
where 1=0
