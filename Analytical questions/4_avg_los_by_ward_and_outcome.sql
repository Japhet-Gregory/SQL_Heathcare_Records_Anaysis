-- 6_avg_los_by_ward_and_outcome.sql
-- Average length of stay by ward and discharge outcome

SELECT
    ward,
    COUNT(*) AS "Admissions",
    ROUND(AVG(days), 1) AS "Avg_LOS_Days"
FROM discharges
WHERE ward IS NOT NULL
GROUP BY ward
ORDER BY "Avg_LOS_Days" DESC;