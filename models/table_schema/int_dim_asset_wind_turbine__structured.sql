with dummy_cte as (
    select 1 as foo
)

select
    cast(null as {{dbt.type_int()}}) as plant_id,
    cast(null as {{dbt.type_int()}}) as wind_turbine_id,
    cast(null as {{dbt.type_string()}}) as wind_turbine_name,
    cast(null as {{dbt.type_numeric()}}) as latitude,
    cast(null as {{dbt.type_numeric()}}) as longitude,
    cast(null as {{dbt.type_numeric()}}) as elevation,
    cast(null as {{dbt.type_numeric()}}) as hub_height,
    cast(null as {{dbt.type_numeric()}}) as rotor_diameter,
    cast(null as {{dbt.type_numeric()}}) as rated_power,
    cast(null as {{dbt.type_string()}}) as manufacturer,
    cast(null as {{dbt.type_string()}}) as model
from dummy_cte
where 1=0
