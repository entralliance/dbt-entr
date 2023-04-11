{% set relation_names = var('fct_entr_time_series_models') %}
{% set relations = [] %}
{%- for rel in relation_names %}
    {% do relations.append( ref(rel) ) %}
{% endfor -%}


select * from
{{dbt_utils.union_relations(
    relations=relations,
    include=dbt_utils.get_filtered_columns_in_relation(ref('int_fct_entr_time_series__structured')),
    column_override=get_entr_column_types()
)}}
