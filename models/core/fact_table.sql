{{
    config(
        materialized='table'
    )
}}

with green_tripdata as (
     {{ calculate_trip_duration() }}
), 

dim_zones as (
    select 
        {{ convert_to_string('locationid') }} AS locationid,
        borough,
        zone
    from {{ ref('dim_zones') }}
    where borough != 'Unknown'
)

select 
    green_tripdata.*,
    pickup_zone.borough as pickup_borough,
    pickup_zone.zone as pickup_zone,
    dropoff_zone.borough as dropoff_borough,
    dropoff_zone.zone as dropoff_zone

from green_tripdata
inner join dim_zones pickup_zone on 
green_tripdata.pickup_location_id = pickup_zone.locationid
inner join dim_zones dropoff_zone on 
green_tripdata.dropoff_location_id = dropoff_zone.locationid