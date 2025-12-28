SELECT 'duplicate' as test_name, listing_id, host_id, count(1) as dup_count FROM dev.dim_listings_cleansed
GROUP BY listing_id,host_id
HAVING count(1) > 1
