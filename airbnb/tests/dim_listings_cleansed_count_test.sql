SELECT
    count_src,
    count_tgt
FROM (
    SELECT
        (SELECT count(1) FROM {{ ref('src_listings') }} ) as count_src,
        (SELECT count(1) FROM {{ ref('dim_listings_cleansed') }} ) as count_tgt
) comparison
WHERE count_src != count_tgt