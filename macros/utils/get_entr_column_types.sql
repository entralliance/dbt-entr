{% macro get_entr_column_types() %}
    {% set overrides = var('entr_column_type_overrides', {}) %}
    {% set coltypes = {
        "PLANT_ID": dbt.type_int(),
        "PLANT_NAME": dbt.type_string(),
        "LATITUDE": dbt.type_numeric(),
        "LONGITUDE": dbt.type_numeric(),
        "PLANT_CAPACITY": dbt.type_numeric(),
        "NUMBER_OF_TURBINES": dbt.type_int(),
        "TURBINE_CAPACITY": dbt.type_numeric(),
        "WIND_TURBINE_ID": dbt.type_int(),
        "WIND_TURBINE_NAME": dbt.type_string(),
        "ELEVATION": dbt.type_numeric(),
        "HUB_HEIGHT": dbt.type_numeric(),
        "ROTOR_DIAMETER": dbt.type_numeric(),
        "RATED_POWER": dbt.type_numeric(),
        "MANUFACTURER": dbt.type_string(),
        "PLANT_NAME": dbt.type_string(),
        "MODEL": dbt.type_string(),
        "REANALYSIS_DATASET_ID": dbt.type_int(),
        "REANALYSIS_DATASET_NAME": dbt.type_string(),
        "ENTR_TAG_ID": dbt.type_int(),
        "DATE_TIME": dbt.type_timestamp(),
        "TAG_VALUE": dbt.type_numeric(),
        "INTERVAL_S": dbt.type_numeric(),
        "VALUE_TYPE": dbt.type_string(),
        "VALUE_UNITS": dbt.type_string(),
        "ENTR_TAG_NAME": dbt.type_string(),
        "LOGICAL_NODE": dbt.type_string(),
        "SENSOR_NAME": dbt.type_string(),
        "PRESENTATION_NAME": dbt.type_string(),
        "STANDARD_UNITS": dbt.type_string(),
        "DATA_TYPE": dbt.type_string(),
        "COLLECTOR_TYPE": dbt.type_string(),
    } %}
    {% for k,v in overrides.items() %}
        {% do coltypes.update({k:v}) %}
    {% endfor %}
    {{return(coltypes)}}
{% endmacro %}
