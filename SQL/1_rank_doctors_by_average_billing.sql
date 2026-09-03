-- Active: 1786371769645@@127.0.0.1@5432@hospital_management
WITH doctor_revenue AS (
    SELECT
    first_name,
    last_name,
    hospital_branch,
    doctors.doctor_id,
    SUM(billing.amount) AS total_revenue
FROM doctors
INNER JOIN appointments ON doctors.doctor_id = appointments.doctor_id
INNER JOIN treatments ON appointments.appointment_id = treatments.appointment_id
INNER JOIN billing ON treatments.treatment_id = billing.treatment_id
GROUP BY doctors.doctor_id,first_name,last_name,hospital_branch
ORDER BY total_revenue DESC
)
SELECT
    first_name,
    last_name,
    hospital_branch,
    total_revenue,
    RANK() OVER (PARTITION BY hospital_branch ORDER BY total_revenue DESC) AS revenue_rank
FROM doctor_revenue