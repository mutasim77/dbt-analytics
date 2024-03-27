{{ 
    config(materialized='table') 
}}

{% set sql_statement %}
    select max(trip_distance) from {{ ref('stg_yellow_tripdata') }}
{% endset %}

select
    taxi.tripid,
    {{ dbt_utils.get_single_value(sql_statement, default=1) }} as longest_distance

from {{ ref('stg_yellow_tripdata') }} as taxi

{% if execute %}
    limit 1
{% endif %}