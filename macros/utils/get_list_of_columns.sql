{#
    TODO:
        - REMOVE MACRO -> should just be able to replace this with dbt_utils.get_filtered_columns_in_relation
        - rename macro
        - rename quote to quote_identifiers (consistent with dbt_utils.star)
        - audit case sensitivity to make sure it won't be a problem
        - allow prefix/suffix
    Adapted from dbt_utils.star
#}
{% macro get_list_of_columns(from, except=[], quote=false) -%}
    {%- do dbt_utils._is_relation(from, 'star') -%}
    {%- do dbt_utils._is_ephemeral(from, 'star') -%}

    {#-- Prevent querying of db in parsing mode. This works because this macro does not create any new refs. #}
    {%- if not execute -%}
        {{ return('') }}
    {% endif %}

    {%- set include_cols = [] %}
    {%- set cols = adapter.get_columns_in_relation(from) -%}
    {%- set except = except | map("lower") | list %}

    {%- for col in cols -%}

        {%- if col.column|lower not in except and quote -%}
            {% do include_cols.append(adapter.quote(col.column)|trim) %}

        {%- elif col.column|lower not in except and not quote -%}
            {% do include_cols.append(col.column) %}

        {%- endif %}

    {%- endfor %}

    {{return(include_cols)}}
{%- endmacro %}
