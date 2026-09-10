-- 8b_overstay_rate_by_ward.sql
WITH ward_stats AS (
    SELECT ward, AVG(days) AS avg_los, STDDEV(days) AS stddev_los
    FROM discharges
    WHERE ward IS NOT NULL
    GROUP BY ward
)
SELECT
    d.ward,
    COUNT(*) AS "Total_Admissions",
    SUM(CASE WHEN d.days > (w.avg_los + 2 * w.stddev_los) THEN 1 ELSE 0 END) AS "Overstay_Count",
    ROUND(100.0 * SUM(CASE WHEN d.days > (w.avg_los + 2 * w.stddev_los) THEN 1 ELSE 0 END) / COUNT(*), 1) AS "Pct_Overstay"
FROM discharges d
JOIN ward_stats w ON d.ward = w.ward
GROUP BY d.ward
ORDER BY "Pct_Overstay" DESC;