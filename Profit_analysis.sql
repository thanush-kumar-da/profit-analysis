use project_profit_analysis;

select * from startup;

describe startup;

--- null counts 
SELECT
  SUM(RD_Spend IS NULL) AS null_rnd,
  SUM(Administration IS NULL) AS null_admin,
  SUM(Marketing_Spend IS NULL) AS null_marketing,
  SUM(State IS NULL) AS null_state,
  SUM(Profit IS NULL) AS null_profit
FROM startup;

--- simple statistics
SELECT
  ROUND(AVG(RD_Spend),2) AS avg_rnd,
  ROUND(MIN(RD_Spend),2) AS min_rnd,
  ROUND(MAX(RD_Spend),2) AS max_rnd,
  ROUND(STDDEV_POP(RD_Spend),2) AS sd_rnd,

  ROUND(AVG(Administration),2) AS avg_admin,
  ROUND(MIN(Administration),2) AS min_admin,
  ROUND(MAX(Administration),2) AS max_admin,
  ROUND(STDDEV_POP(Administration),2) AS sd_admin,

  ROUND(AVG(Marketing_Spend),2) AS avg_marketing,
  ROUND(MIN(Marketing_Spend),2) AS min_marketing,
  ROUND(MAX(Marketing_Spend),2) AS max_marketing,
  ROUND(STDDEV_POP(Marketing_Spend),2) AS sd_marketing,

  ROUND(AVG(Profit),2) AS avg_profit,
  ROUND(MIN(Profit),2) AS min_profit,
  ROUND(MAX(Profit),2) AS max_profit,
  ROUND(STDDEV_POP(Profit),2) AS sd_profit
FROM startup;

--- inspect state distribution
SELECT State, COUNT(*) AS cnt, ROUND(AVG(Profit),2) AS avg_profit
FROM startup
GROUP BY State
ORDER BY cnt DESC;

--- duplicate rows (exact duplicates)
SELECT COUNT(*) - COUNT(DISTINCT CONCAT_WS('|', RD_Spend, Administration, Marketing_Spend, State, Profit)) AS duplicate_count
FROM startup;

select * from startup;