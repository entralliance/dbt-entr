{#
    TODO:
        - break up values into columns of different types (numeric, string, date/timestamp, (boolean?))
#}

with dummy_cte as (
    select 1 as foo
)

select
    cast(null as {{dbt.type_int()}}) as asset_id,
    cast(null as {{dbt.type_int()}}) as entr_tag_id,
    cast(null as {{dbt.type_int()}}) as tag_subtype_id,
    cast(null as {{dbt.type_timestamp()}}) as date_time,
    cast(null as {{dbt.type_numeric()}}) as tag_value,
    cast(null as {{dbt.type_numeric()}}) as interval_s,
    cast(null as {{dbt.type_string()}}) as value_type,
    cast(null as {{dbt.type_string()}}) as value_units
from dummy_cte
where 1=0
