-- on_schema_change = 'fail' -> Nếu schema của dữ liệu thay đổi thì job fail ngay lập tức để tránh làm hỏng bảng target
{{
    config(
        materialized='incremental',
        on_schema_change = 'fail'
    )
}}

WITH src_reviews AS(
    SELECT * FROM {{ ref('src_reviews') }}
)

SELECT * FROM src_reviews WHERE review_text IS NOT NULL
{% if is_incremental()%}
    AND review_date > (SELECT MAX(review_date) FROM {{ this }})
{% endif %}
-- is_incremental tức là model chạy tải tăng cường chứ không phải full-refresh
