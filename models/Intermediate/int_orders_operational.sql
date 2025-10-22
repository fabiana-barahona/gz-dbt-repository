SELECT
m.orders_id
, m.date_date
, ROUND(m.margin + s.shipping_fee - logCost - ship_cost, 2) AS operational_margin
, m.revenue AS revenue
, m.quantity AS quantity
FROM {{ ref('int_orders_margin') }} AS m
LEFT JOIN {{ ref('stg_raw__ship') }} AS s
USING (orders_id)
ORDER BY date_date DESC , orders_id DESC