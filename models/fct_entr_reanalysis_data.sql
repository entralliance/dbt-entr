{# 
    TODO:
        - figure out how to append data from demarcated source relations to this table structure
#}

with
    structure as (
        select
            cast(0 as {{dbt_utils.type_int()}}) as plant_id,
            cast(0 as {{dbt_utils.type_int()}}) as reanalysis_dataset_id,
            cast(0 as {{dbt_utils.type_int()}}) as entr_tag_id,
            cast('2000-01-01 00:00:00Z' as {{dbt_utils.type_timestamp()}}) as date_time,
            cast(0 as {{dbt_utils.type_numeric()}}) as tag_value,
            cast(0 as {{dbt_utils.type_numeric()}}) as interval_s,
            cast('str' as {{dbt_utils.type_string()}}) as value_type,
            cast('str' as {{dbt_utils.type_string()}}) as value_units
    )

select top 0 * from structure
