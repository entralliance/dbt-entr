# dbt-entr
The ENTR Alliance's dbt package for standardized warehouse transformations in the renewable energy industry

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

Example data exist as seeds in this package - to turn them on, set their configuration to enabled (then you can add their model names to the appropriate `vars` list above):
```yml
seeds:
    entr:
        examples:
            +enabled: true
```

### Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](https://community.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices
