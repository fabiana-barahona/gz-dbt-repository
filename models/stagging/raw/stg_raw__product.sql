
SELECT
    products_id
    ,CAST(purchSE_PRICE AS FLOAT64) AS purchase_cost
FROM {{ source('raw', 'product') }}