-- 8_overstay_patterns.sql
-- Which admissions are overstays, and where do they cluster?

WITH ward_stats AS (
    SELECT
        ward,
        AVG(days) AS avg_los,
        STDDEV(days) AS stddev_los
    FROM discharges
    WHERE ward IS NOT NULL
    GROUP BY ward
)
SELECT
    d.ward,
    d.patient_number,
    d.days AS "LOS_Days",
    ROUND(w.avg_los, 1) AS "Ward_Avg_LOS",
    ROUND(d.days - w.avg_los, 1) AS "Days_Over_Average",
    d.discharge_reason AS "Outcome"
FROM discharges d
JOIN ward_stats w ON d.ward = w.ward
WHERE d.days > (w.avg_los + 2 * w.stddev_los)
ORDER BY "Days_Over_Average" DESC;