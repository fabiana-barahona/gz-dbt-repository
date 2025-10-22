SELECT
    s.date_date
    ,s.products_id
    ,s.revenue
    ,s.quantity
    ,s.orders_id
    ,(p.purchase_price * s.quantity) AS purchase_cost
    ,(s.revenue - ((p.purchase_price * s.quantity) * s.quantity)) AS margin
FROM {{ ref('stage_raw__sales') }} AS s
LEFT JOIN {{ref('stg_raw__product')}} AS p
ON s.products_id = p.products_id