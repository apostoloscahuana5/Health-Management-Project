-- Active: 1786371769645@@127.0.0.1@5432@hospital_management
WITH patient_billing AS(
SELECT
    billing.patient_id,
    first_name,
    last_name,
    insurance_provider,
    SUM(amount) AS total_billing
FROM billing
INNER JOIN patients ON patients.patient_id = billing.patient_id
GROUP BY first_name,last_name, billing.patient_id, insurance_provider
),
ranked_patients AS (
    SELECT
        *,
        ROW_NUMBER() OVER (PARTITION BY insurance_provider ORDER BY total_billing DESC) AS row_num
    FROM patient_billing
)
SELECT *
FROM ranked_patients
WHERE row_num <= 3