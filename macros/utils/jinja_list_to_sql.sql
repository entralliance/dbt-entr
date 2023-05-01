{# This macro converts a jinja list into lines for selection in a sql statement #}
{#
    TODO:
        - add suffix param
        - type control?
#}

{% macro jinja_list_to_sql(jinja_list, exclude = [], relation_alias=False, field_separator=',\n', quote_identifiers=false) -%}
    {{ return(adapter.dispatch('jinja_list_to_sql', 'entr')(jinja_list, exclude, relation_alias, field_separator, quote_identifiers)) }}
{% endmacro %}

{% macro default__jinja_list_to_sql(jinja_list, exclude = [], relation_alias=False, field_separator=',\n', quote_identifiers=false) %}
    {%- for col in jinja_list %}
        {%- if col not in exclude %}
            {%- if relation_alias %}{{ relation_alias }}.{% else %}{%- endif -%}
                {%- if quote_identifiers %}{{adapter.quote(col)}}
                {%- else %}{{col}}{% endif -%}
            {%- if not loop.last %}{{ field_separator }}{% endif -%}
        {% endif -%}
    {%- endfor -%}    
{% endmacro %}
