{#
    TODO:
        - align fact table column names (e.g. all with _data suffix or not)
        - remove standard units -> need to figure out unit handling generally
#}

with
    structure as (
        select
            cast(0 as {{dbt_utils.type_int()}}) wind_turbine_id,
            cast(0 as {{dbt_utils.type_int()}}) entr_tag_id,
            cast('2000-01-01 00:00:00Z' as {{dbt_utils.type_timestamp()}}) as date_time,
            cast(0 as {{dbt_utils.type_numeric()}}) as tag_value,
            cast(0 as {{dbt_utils.type_numeric()}}) as interval_s,
            cast('str' as {{dbt_utils.type_string()}}) as value_type,
            cast('str' as {{dbt_utils.type_string()}}) as value_units,
            cast('str' as {{dbt_utils.type_string()}}) as standard_units
    )

select top 0 * from structure
