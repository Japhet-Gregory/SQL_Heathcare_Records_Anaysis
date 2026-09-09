-- 7_admissions_by_day_of_week.sql
-- Which day of the week is admission most likely to happen?

SELECT
    TO_CHAR(date_admitted, 'Day') AS "Day_Of_Week",
    COUNT(*) AS "Admissions"
FROM discharges
WHERE date_admitted IS NOT NULL
GROUP BY TO_CHAR(date_admitted, 'Day'), EXTRACT(DOW FROM date_admitted)
ORDER BY "Admissions" DESC;