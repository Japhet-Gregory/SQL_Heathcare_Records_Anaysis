-- 9_normal_vs_non_normal_by_ward.sql
-- What's the normal vs non-normal discharge split by ward?

SELECT
    ward,
    COUNT(*) AS "Total_Admissions",
    SUM(CASE WHEN discharge_reason = 'Normal Discharge' THEN 1 ELSE 0 END) AS "Normal_Discharge",
    SUM(CASE WHEN discharge_reason != 'Normal Discharge' THEN 1 ELSE 0 END) AS "Non_Normal_Discharge"
FROM discharges
WHERE ward IS NOT NULL
GROUP BY ward;