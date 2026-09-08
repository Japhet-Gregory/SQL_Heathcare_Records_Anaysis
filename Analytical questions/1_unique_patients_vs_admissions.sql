SELECT
    ward,
    COUNT(*) AS total_admissions,
    COUNT(DISTINCT patient_number) AS unique_patients,
    COUNT(*) - COUNT(DISTINCT patient_number) AS readmissions
FROM discharges
GROUP BY ward;