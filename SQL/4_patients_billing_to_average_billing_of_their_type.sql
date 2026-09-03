-- Active: 1786371769645@@127.0.0.1@5432@hospital_management
SELECT
    first_name,
    last_name,
    amount,
    treatment_type,
    ROUND(AVG(amount) OVER (PARTITION BY treatment_type), 2) AS avg_per_treatment,
    ROUND(amount - AVG(amount) OVER (PARTITION BY treatment_type), 2) AS difference
FROM billing
INNER JOIN treatments ON treatments.treatment_id = billing.treatment_id
INNER JOIN patients ON patients.patient_id = billing.patient_id
