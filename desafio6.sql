SELECT
  MIN(p.plan_value) AS faturamento_minimo,
  MAX(p.plan_value) AS faturamento_maximo,
  ROUND(AVG(p.plan_value), 2) AS faturamento_medio,
  ROUND(SUM(p.plan_value), 2) AS faturamento_total
FROM SpotifyClone.users AS u
INNER JOIN SpotifyClone.plans AS p ON u.plan_id = p.plan_id;