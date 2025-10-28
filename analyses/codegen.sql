--step1: generate schema.yml for staging-models

{{ codegen.generate_model_yaml(
    model_names=['stg_invoices']
) }}

{{ codegen.generate_model_yaml(
    model_names=['stg_movie_catalogue']
) }}

{{ codegen.generate_model_yaml(
    model_names=['stg_nj_001']
) }}

{{ codegen.generate_model_yaml(
    model_names=['stg_nj_002']
) }}

{{ codegen.generate_model_yaml(
    model_names=['stg_nj_003']
) }}



--step2: generate schema.yml for intermediate-models

{{ codegen.generate_model_yaml(
    model_names=['int_monthly_performance']
) }}

{{ codegen.generate_model_yaml(
    model_names=['int_movie_revenues']
) }}



--step3: generate schema.yml for mart-model

{{ codegen.generate_model_yaml(
    model_names=['mart_monthly_performance']
) }}