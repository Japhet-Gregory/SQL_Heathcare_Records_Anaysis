SELECT
    district,
    COUNT(*) AS "Total_Admissions",
    SUM(CASE WHEN discharge_reason = 'Normal Discharge' THEN 1 ELSE 0 END) AS "Normal",
    SUM(CASE WHEN discharge_reason = 'Death' THEN 1 ELSE 0 END) AS "Death",
    SUM(CASE WHEN discharge_reason = 'DAMA' THEN 1 ELSE 0 END) AS "Dama",
    SUM(CASE WHEN discharge_reason = 'Referred' THEN 1 ELSE 0 END) AS "Referred",
    SUM(CASE WHEN discharge_reason = 'Escape' THEN 1 ELSE 0 END) AS "Escape",
    ROUND(100.0 * SUM(CASE WHEN discharge_reason = 'Death' THEN 1 ELSE 0 END) / COUNT(*), 1) AS "Pct_Death",
    ROUND(100.0 * SUM(CASE WHEN discharge_reason = 'Normal Discharge' THEN 1 ELSE 0 END) / COUNT(*), 1) AS "Pct_Normal"
FROM discharges
WHERE district IS NOT NULL
GROUP BY district
ORDER BY "Pct_Death" DESC;