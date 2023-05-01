<h1 align="center">dbt-entr</h1>
<p align="center">
<img alt="logo" width="20%" src="https://images.squarespace-cdn.com/content/v1/5d2f4cea430e880001ddfba8/1579219580580-2SAK7YKA6CX7P9VK57XT/ENTR+White+Logo_White.png?format=1500w" />
</p>

<hr/>

<p align="center">
<a href="https://circleci.com/gh/entralliance/dbt-entr/tree/main">
<img alt="CircleCI" src="https://circleci.com/gh/entralliance/dbt-entr.svg?style=shield"/>
</a>
<img alt="License" src="https://img.shields.io/badge/License-MIT-yellow.svg"/>
</p>

The ENTR Foundation's dbt package for standardized warehouse transformations in the renewable energy industry


## Data Warehouse Compatibility

This package has been tested for compatibility with the following warehouse types:

* [x] **Postgres**  ![](https://raw.githubusercontent.com/elementary-data/elementary/master/static/postgres-16.png)
* [x] **Snowflake** ![](https://raw.githubusercontent.com/elementary-data/elementary/master/static/snowflake-16.png) 
* [x] **BigQuery**  ![](https://raw.githubusercontent.com/elementary-data/elementary/master/static/bigquery-16.svg) 
* [x] **Spark/Databricks**  ![](https://raw.githubusercontent.com/elementary-data/elementary/master/static/databricks-16.png)

*Note:* this package may work with other warehouse types not listed above but their compatibility has not been tested.

## Configuration

The following project-level variables should be set in your `dbt_project.yml` to specify which models get ingested by the standard ENTR models:
```yml
vars:
    entr:
        dim_entr_asset_models: [<list of models to be ingested by the dim_entr_asset dimensional model from this package>]
        fct_entr_time_series_models: [<list of models to be ingested by the fct_entr_reanalysis_data fact model from this package>]
```

You may also want to override the default column types in the ENTR models by passing a dictionary of column names with the desired data types to override to:
```yml
vars:
    entr:
        entr_column_type_overrides: {<column in ENTR models>: <override datatype>}
```

You may also want to change the materialization type (or other properties such as the database or schema) of the standard ENTR models:
```yml
models:
    entr:
        +materialized: view
        dimensions:
            +materialized: table
```

