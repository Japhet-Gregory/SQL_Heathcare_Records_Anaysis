SELECT
    ward,
    COUNT(*) AS total_admissions,
    SUM(CASE WHEN discharge_reason != 'Normal Discharge' THEN 1 ELSE 0 END) AS non_normal_discharges,
    ROUND(
        100.0 * SUM(CASE WHEN discharge_reason != 'Normal Discharge' THEN 1 ELSE 0 END) / COUNT(*),
        1
    ) AS pct_non_normal_discharge
FROM discharges
where ward IS NOT NULL
GROUP BY ward
ORDER BY pct_non_normal_discharge DESC;