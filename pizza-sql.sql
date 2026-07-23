SELECT
    c.name,
    c.phone,
    COUNT(o.id)        AS всего_заказов,
    MAX(o.created_at)  AS последний_заказ
FROM clients c
JOIN orders o ON o.client_id = c.id
GROUP BY c.name, c.phone
HAVING COUNT(o.id) > 2
   AND MAX(o.created_at) < CURRENT_DATE - INTERVAL '14 days';