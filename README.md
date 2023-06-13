<h1 align="center">dbt-entr</h1>
<p align="center">
<img alt="dbt-logo" width="20%" src="https://github.com/entralliance/entralliance.github.io/raw/main/images/dbt-logo.png" />
<img alt="logo" width="20%" src="https://raw.githubusercontent.com/entralliance/entralliance.github.io/main/images/entr-logo-grey.svg?format=1500w" />
</p>

<hr/>

<p align="center">
<a href="https://circleci.com/gh/entralliance/dbt-entr/tree/main">
<img alt="CircleCI" src="https://circleci.com/gh/entralliance/dbt-entr.svg?style=shield"/>
</a>
<img alt="License" src="https://img.shields.io/badge/License-MIT-yellow.svg"/>
</p>

`dbt-entr` is the ENTR Foundation's dbt package for standardized warehouse transformations for the renewable energy industry.

This package provides an opinionated yet flexible approach to structuring and naming renewable energy industry data within data warehouses to enable a common ground for building analytical tools within the industry.

## Data Warehouse Compatibility

`dbt-entr` has been tested for compatibility with the following warehouse types:

* [x] **Postgres**  ![](https://raw.githubusercontent.com/entralliance/entralliance.github.io/main/images/postgres-icon.png)
* [x] **Snowflake** ![](https://raw.githubusercontent.com/entralliance/entralliance.github.io/main/images/snowflake-icon.png) 
* [x] **BigQuery**  ![](https://raw.githubusercontent.com/entralliance/entralliance.github.io/main/images/bigquery-icon.svg) 
* [x] **Spark/Databricks**  ![](https://raw.githubusercontent.com/entralliance/entralliance.github.io/main/images/databricks-icon.png)

*Note:* this package may work with other warehouse types not listed above but their compatibility has not been tested.

## Installation

To install this package, add it to your `packages.yml` file in your dbt project's root directory along with the desired package version:

```yaml
packages:
  - git: "https://github.com/entralliance/dbt-openoa.git"
    revision: 0.0.2
```

## Configuration

The following project-level variables should be set in your `dbt_project.yml` to specify which models get ingested by the standard ENTR models:
```yaml
vars:
    entr:
        dim_entr_asset_models: [<list of models to be ingested by the dim_entr_asset dimensional model from this package>]
        fct_entr_time_series_models: [<list of models to be ingested by the fct_entr_reanalysis_data fact model from this package>]
```

The models specified in these lists should contain fields of the same names as the standard ENTR models into which they will be fed.

- the dimensional models, i.e. those specified in the `dim_entr_asset_models` list, must contain at least the 3 fields specified in the `dim_entr_asset` docs [here](https://entralliance.github.io/dbt-entr/#!/model/model.entr.dim_entr_asset), i.e. `ASSET_ID`, `ASSET_NAME`, and `ASSET_TYPE` - any other fields included in the upstream models will be appended to the `dim_entr_asset` model for flexible management of metadata
- the fact models, i.e. those specified in the `fct_entr_time_series_models` list, should contain all of the fields specified in the `fct_entr_time_series` docs [here](https://entralliance.github.io/dbt-entr/#!/model/model.entr.fct_entr_time_series) - any additional columns will not cause an error but will be ignored

### Overriding Default Column Types

By default, `dbt-entr` uses the column types returned by `dbt.type_<column type>()` macros, which will vary slightly depending on the warehouse adapter used in your dbt project. For example, the `DATE_TIME` column in the `fct_entr_time_series` ENTR standard model will be cast to the type `TIMESTAMP_NTZ` by default for Snowflake targets. You may want to override these default column types in the ENTR models, which you can do by passing a dictionary of column names with the desired data type overrides:

```yaml
vars:
    entr:
        entr_column_type_overrides: {<column in ENTR models>: <override datatype>}
```

For example, if you wanted to override the default `TIMESTAMP_NTZ` to `TIMESTAMP_TZ` for the `DATE_TIME` column, you could use the following:

```yaml
vars:
    entr:
        entr_column_type_overrides: {"DATE_TIME": "TIMESTAMP_TZ"}
```

*Note*: the column names to override must be specified in uppercase for these overrides to work.

### Specifying Materialization Types

You may also want to change the materialization type (or other properties such as the database or schema in which models are materialized) of the standard ENTR models, which can be done by specifying those materialization properties in your `dbt_project.yml`:

```yml
models:
    entr:
        +materialized: view
        dimensions:
            +materialized: table
```

