SELECT
int_margin.*
, stg_ship.shipping_fee AS shipping_fee
, stg_ship.logCost AS log_cost
, stg_ship.ship_cost AS ship_cost
, ROUND((int_margin.margin + stg_ship.shipping_fee - stg_ship.logCost - CAST(stg_ship.ship_cost AS FLOAT64)), 2) AS operational_margin
FROM {{ ref('int_orders_margin')}} AS int_margin
LEFT JOIN {{ ref('stg_raw__ship')}} AS stg_ship
USING(orders_id)
ORDER BY orders_id DESC