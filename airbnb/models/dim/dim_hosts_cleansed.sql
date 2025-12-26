WITH src_hosts AS(
    SELECT * FROM {{ ref('src_hosts') }}
)

-- host_name is not null -> keep original value
-- host_name is null -> Anonymous
-- NVL (column_name,default null value)
SELECT 
    host_id,
    is_superhost,
    created_at,
    updated_at,
    NVL(host_name, 'Anonymous') as host_name
FROM src_hosts