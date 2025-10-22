SELECT 
    f.date_date,
    SUM(f.operational_margin - i.ads_cost) AS ads_margin,
    SUM(f.average_basket) AS average_basket,
    SUM(f.operational_margin) AS operational_margin,
    SUM(i.ads_cost) AS ads_cost,
    SUM(i.impression) AS ads_impression,
    SUM(i.click) AS ads_click,
    SUM(f.quantity) AS quantity,
    SUM(f.revenue) AS revenue,
    SUM(f.purchase_cost) AS purchase_cost,
    SUM(f.margin) AS margin,
    SUM(f.shipping_fee) AS shipping_fee,
    SUM(f.log_cost) AS log_cost,
    SUM(f.ship_cost) AS ship_cost
FROM 
    {{ ref('int_campaigns') }} AS i
LEFT JOIN 
    {{ ref('finance_days') }} AS f
ON 
    f.date_date = i.date_date
GROUP BY 
    f.date_date