{{
    config(
        materialized = 'table'
    )
}}
WITH 
list AS (
    SELECT * FROM {{ ref('src_listings')}}
),
host AS (
    SELECT * FROM {{ ref('src_hosts')}}
)

SELECT
    list.listing_id,
    list.listing_name,
    list.room_type,
    list.minimum_nights,
    list.price_str,
    host.host_id,
    host.host_name,
    host.is_superhost as host_is_superhost,
    list.created_at,
    GREATEST(list.updated_at, host.updated_at) AS updated_at
FROM list
LEFT JOIN host ON list.host_id = host.host_id
