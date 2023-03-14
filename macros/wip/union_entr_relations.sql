{#
{% macro union_entr_relations(entr_table) -%}
    {{ return(adapter.dispatch('union_entr_relations', 'entr')(entr_table)) }}
{% endmacro %}

{#  #}
{% macro default__union_entr_relations(entr_table) %}
    {#-- Prevent querying of db in parsing mode. This works because this macro does not create any new refs. -#}
    {%- if not execute %}
        {{ return('') }}
    {% endif -%}
    {%- set _relation_names=entr.get_entr_relations(entr_table=entr_table) %}
    {%- for rel in _relation_names %}
-- depends_on: {{ref(rel)}}
    {% endfor %}

    {% set _relations = [] %}
    {% for rel in _relation_names %}
        {% do _relations.append( ref(rel) ) %}
    {% endfor %}

    select * from
    {{dbt_utils.union_relations(
        relations=_relations,
        include=dbt_utils.get_filtered_columns_in_relation(ref('int_' ~ entr_table ~ '__structured')),
        column_override={
            "PLANT_ID": dbt.type_int(),
            "WIND_TURBINE_ID": dbt.type_int(),
            "REANALYSIS_DATASET_ID": dbt.type_int(),
            "ENTR_TAG_ID": dbt.type_int(),
            "DATE_TIME": dbt.type_timestamp(),
            "TAG_VALUE": dbt.type_numeric(),
            "INTERVAL_S": dbt.type_numeric(),
            "VALUE_TYPE": dbt.type_string(),
            "VALUE_UNITS": dbt.type_string(),
        }
    )}}
{% endmacro %}
#}
