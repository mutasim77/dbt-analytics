with 

source as (

    select * from {{ source('staging', 'yellow_tripdata') }}

),

renamed as (

    select
        vendor_id,
        pickup_datetime,
        dropoff_datetime,
        passenger_count,
        trip_distance,
        rate_code,
        store_and_fwd_flag,
        payment_type,
        fare_amount,
        extra,
        mta_tax,
        tip_amount,
        tolls_amount,
        imp_surcharge,
        airport_fee,
        total_amount,
        pickup_location_id,
        dropoff_location_id,
        data_file_year,
        data_file_month

    from source

)

select * from renamed
