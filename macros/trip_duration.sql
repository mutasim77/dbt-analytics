{% macro calculate_trip_duration() %}
    SELECT *,
        TIMESTAMP_DIFF(dropoff_datetime, pickup_datetime, SECOND) AS trip_duration_seconds
    FROM {{ ref('stg_green_tripdata') }}
{% endmacro %}
