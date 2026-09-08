SELECT
    ward,
    ROUND(AVG(age_yrs), 1) AS avg_age,
    COUNT(*) AS total_admissions
FROM discharges
where ward IS NOT NULL
GROUP BY ward
ORDER BY avg_age DESC;