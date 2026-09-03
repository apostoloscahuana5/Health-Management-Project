-- Active: 1786371769645@@127.0.0.1@5432@hospital_management
SELECT
    hc1.first_name,
    hc1.last_name,
    a1.appointment_date AS first_appointment,
    a2.appointment_date AS second_appointment
FROM patients hc1
JOIN patients hc2 ON hc1.first_name = hc2.first_name 
    AND hc1.last_name = hc2.last_name
JOIN appointments a1 ON a1.patient_id = hc1.patient_id
JOIN appointments a2 ON a2.patient_id = hc2.patient_id
WHERE a2.appointment_date > a1.appointment_date
AND a2.appointment_date <= a1.appointment_date + INTERVAL '30 days'