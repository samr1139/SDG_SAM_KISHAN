{{ config(materialized='table') }}

{% set cols = adapter.get_columns_in_relation(ref('curated_traffic_and_depl_all_metrics')) %}

SELECT
    {% for col in cols if 'popstats' not in col.name | lower %}
        {{ col.name }} AS "{{ col.name | replace('_', ' ') | title }}"
        {% if not loop.last %},{% endif %}
    {% endfor %}
FROM {{ ref('curated_traffic_and_depl_all_metrics') }}