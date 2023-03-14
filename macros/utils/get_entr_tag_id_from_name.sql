{#
    TODO:
        - add (potentially optional) validation that a single record is retrieved by query
#}
{% macro get_entr_tag_id_from_name(entr_tag_name) %}
    {{ return(adapter.dispatch('get_entr_tag_id_from_name', 'entr')(entr_tag_name)) }}
{% endmacro %}

{% macro default__get_entr_tag_id_from_name(entr_tag_name) %}

    {% set sql_statement -%}
        select entr_tag_id from {{ ref('dim_entr_tag_list') }} where entr_tag_name = '{{entr_tag_name}}'
    {%- endset %}

    {%- set tag = dbt_utils.get_single_value(sql_statement) -%}
    
    {% do return(tag.get('ENTR_TAG_ID')[0]) %}

{% endmacro %}
