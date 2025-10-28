--step1: generate schema.yml for staging-models

{{ codegen.generate_model_yaml(
    model_names=['stg_invoices', 'stg_movie_catalogue', 'stg_nj_001', 'stg_nj_002', 'stg_nj_003']
) }}



--step2: generate schema.yml for intermediate-models

{{ codegen.generate_model_yaml(
    model_names=['int_monthly_performance', 'int_monthly_revenues']
) }}



--step3: generate schema.yml for mart-model

{{ codegen.generate_model_yaml(
    model_names=['mart_monthly_performance']
) }}