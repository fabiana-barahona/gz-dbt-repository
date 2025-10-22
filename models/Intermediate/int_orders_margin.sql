SELECT
  date_date,   -- FIX: No leading comma on the first column, but a trailing comma to separate from the next
  orders_id,
  ROUND(SUM(revenue),2) AS revenue,
  SUM(quantity) AS quantity,
  ROUND(SUM(purchase_cost),2) AS purchase_cost,
  ROUND(SUM(margin),2) AS margin
FROM {{ ref('int_sales_margin') }}
GROUP BY orders_id, date_date
ORDER BY date_date DESC , orders_id DESC