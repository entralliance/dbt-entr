{#
    TODO:
        - add flexibility to restrict dim cols to only those in ENTR or not
            i.e. whether `include=dbt_utils.get_filtered_columns_in_relation(ref('int_dim_entr_asset__structured')),` is added to union or not
#}

{% set relation_names = var('dim_entr_asset_models') %}
{% set relations = [] %}
{%- for rel in relation_names %}
    {% do relations.append( ref(rel) ) %}
{% endfor -%}


select * from
{{dbt_utils.union_relations(
    relations=relations,
    column_override=get_entr_column_types()
)}}
