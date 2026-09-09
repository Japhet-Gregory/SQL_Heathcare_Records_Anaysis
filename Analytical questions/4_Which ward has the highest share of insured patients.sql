-- 4_insured_share_by_ward.sql
-- Which ward has the highest share of insured (vs cash, vs other/unclear) patients?

SELECT
    ward,
    COUNT(*) AS total_admissions,
    SUM(CASE WHEN sponsor = 'Cash' THEN 1 ELSE 0 END) AS cash_admissions,
    SUM(CASE WHEN sponsor IN ('NHIF', 'MHIS', 'NSSF', 'CHF', 'Other Insurance')
             THEN 1 ELSE 0 END) AS insured_admissions,
    SUM(CASE WHEN sponsor IN ('Fast Track', 'Strategies', 'Jkt Bulombola')
             THEN 1 ELSE 0 END) AS other_admissions,
    ROUND(
        100.0 * SUM(CASE WHEN sponsor IN ('NHIF', 'MHIS', 'NSSF', 'CHF', 'Other Insurance')
                         THEN 1 ELSE 0 END) / COUNT(*),
        1
    ) AS insured_pct
FROM discharges
WHERE ward IS NOT NULL
GROUP BY ward
ORDER BY insured_pct DESC;