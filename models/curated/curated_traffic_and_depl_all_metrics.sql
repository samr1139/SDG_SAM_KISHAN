{{ config(materialized='table') }}

SELECT
    *,
    CASE
        WHEN LOWER(category) LIKE '%groceries%'
          OR LOWER(category) LIKE '%gas stations & convenience stores%'
          OR LOWER(category) LIKE '%superstores%'
        THEN 'Off-Premise'
        ELSE 'On-Premise'
    END AS premise_type
FROM {{ ref('stage_traffic_and_depl_all_metrics') }}
