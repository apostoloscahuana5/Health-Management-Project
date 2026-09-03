-- Active: 1786371769645@@127.0.0.1@5432@hospital_management
SELECT
    first_name,
    last_name,
    patients.patient_id,
    SUM(amount) as total_billing
from billing
INNER JOIN patients ON patients.patient_id = billing.patient_id
WHERE amount > (
    SELECT
    AVG(amount)
    from billing
)
GROUP BY first_name, last_name,patients.patient_id