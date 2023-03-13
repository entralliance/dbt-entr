{% macro union_entr_relations(entr_table, column_list) -%}
    {{ return(adapter.dispatch('union_entr_relations', 'entr')(entr_table, column_list)) }}
{% endmacro %}

{# dbt_utils.get_filtered_columns_in_relation(ref('int_' ~ entr_table ~ '__structured') #}
{% macro default__union_entr_relations(entr_table, column_list) %}
    {{dbt_utils.union_relations(
        relations=entr.get_entr_relations(entr_table=entr_table),
        include=column_list,
        column_override={
            "PLANT_ID": dbt_utils.type_int(),
            "WIND_TURBINE_ID": dbt_utils.type_int(),
            "REANALYSIS_DATASET_ID": dbt_utils.type_int(),
            "ENTR_TAG_ID": dbt_utils.type_int(),
            "DATE_TIME": dbt_utils.type_timestamp(),
            "TAG_VALUE": dbt_utils.type_numeric(),
            "INTERVAL_S": dbt_utils.type_numeric(),
            "VALUE_TYPE": dbt_utils.type_string(),
            "VALUE_UNITS": dbt_utils.type_string(),
        }
    )}}
{% endmacro %}
