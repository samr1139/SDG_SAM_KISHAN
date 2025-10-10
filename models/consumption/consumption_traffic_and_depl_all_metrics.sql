{{ config(materialized='table') }}

{% set cols = adapter.get_columns_in_relation(ref('curated_traffic_and_depl_all_metrics')) %}

SELECT
    {% for col in cols if 'popstats' not in col.name | lower %}
        {{ col.name }} AS "{{ col.name | replace('_', ' ') | title }}"
        {% if not loop.last %},{% endif %}
    {% endfor %}
<<<<<<< HEAD
FROM {{ ref('curated_traffic_and_depl_all_metrics') }}
=======
FROM {{ ref('curated_traffic_and_depl_all_metrics') }}

>>>>>>> fda1df3fef9034a12d87d285015f9ea7b62482c1
