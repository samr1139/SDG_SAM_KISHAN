{{ config(materialized='table') }}

SELECT
    *,
    CASE
        WHEN LOWER(category) LIKE '%groceries%'
          OR LOWER(category) LIKE '%gas stations & convenience stores%'
          OR LOWER(category) LIKE '%superstores%'
        THEN 'Off-Premise'
        ELSE 'On-Premise'
    END AS premise_type,
    
    CASE
        WHEN TOTAL_YEARLY_FOOT_TRAFFIC = 0 THEN NULL
        ELSE TOTAL_DEPLETIONS_R12 / TOTAL_YEARLY_FOOT_TRAFFIC
    END AS sales_efficiency_ratio

FROM {{ ref('stage_traffic_and_depl_all_metrics') }}