with dummy_cte as (
    select 1 as foo
)

select
    cast(null as {{dbt.type_int()}}) as plant_id,
    cast(null as {{dbt.type_string()}}) as plant_name,
    cast(null as {{dbt.type_numeric()}}) as latitude,
    cast(null as {{dbt.type_numeric()}}) as longitude,
    cast(null as {{dbt.type_numeric()}}) as plant_capacity,
    cast(null as {{dbt.type_int()}}) as number_of_turbines,
    cast(null as {{dbt.type_numeric()}}) as turbine_capacity
from dummy_cte
where 1=0
