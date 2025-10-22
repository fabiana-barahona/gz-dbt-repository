SELECT
    orders_id
    ,shipping_fee
    ,logCost
    , CAST(ship_cost AS INT64) AS ship_cost
FROM {{ source('raw', 'ship') }}