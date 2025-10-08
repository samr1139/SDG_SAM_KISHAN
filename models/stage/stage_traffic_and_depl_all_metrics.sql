select
    t1.id as account_id,

    initcap(t1.name) as account_name,

    left(trim(cast(t1.zipcode as varchar)), 5) as zip_code,

    t1.* exclude (
        id,
        name,
        type,
        latest_metadata_pub_date,
        zipcode,
        avg_visitors_percent_by_freq_1,
        avg_visitors_percent_by_freq_2,
        avg_visitors_percent_by_freq_3,
        avg_visitors_percent_by_freq_4,
        avg_visitors_percent_by_freq_5,
        avg_visitors_percent_by_freq_6,
        avg_visitors_percent_by_freq_7,
        avg_visitors_percent_by_freq_8,
        avg_visitors_percent_by_freq_9,
        avg_visitors_percent_by_freq_10,
        avg_visitors_percent_by_freq_15,
        avg_visitors_percent_by_freq_20,
        avg_visitors_percent_by_freq_30_or_more
    )

from {{ ref("base_traffic_and_depl_all_metrics") }} t1

where
    t1.id is not null
    and t1.total_depletions_r12 is not null
    and (total_yearly_foot_traffic is not null or total_yearly_foot_traffic = 0)
